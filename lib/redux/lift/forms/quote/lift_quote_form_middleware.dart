import 'dart:async';

import 'package:oust/redux/lift/lift_actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'lift_quote_form_actions.dart';
import '../../../auth/auth_actions.dart';
import '../../../customer/customer_actions.dart';
import '../../../app/app_state.dart';
import '../../../../data/models/lift_quote_form.dart';
import '../../../../data/models/lift.dart';
import '../../../../data/models/lift_image.dart';

import '../../../../data/repository.dart';

class LiftQuoteFormMiddleware {
  final Repository repository;
  const LiftQuoteFormMiddleware(this.repository);

  List<Middleware<AppState>> createLiftQuoteFormMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, AddLiftImage>(_addLiftImage),
      TypedMiddleware<AppState, DeleteLiftImage>(_deleteLiftImage),
      TypedMiddleware<AppState, PostLiftLeadRequest>(_postLead),
      TypedMiddleware<AppState, SubmitLiftQuoteFormRequest>(_submitForm),
    ];
  }

  void _addLiftImage(Store<AppState> store, AddLiftImage action, NextDispatcher next) async {
    next(action);

    try {
      final ByteData byteData = await action.image.requestOriginal(quality: 80);
      final List<int> imageData = byteData.buffer.asUint8List();
      final StorageMetadata metadata = StorageMetadata(contentType: 'image/jpeg');
      final StorageReference ref = FirebaseStorage.instance.ref().child('lifts/${action.uuid}.jpg');
      final StorageUploadTask uploadTask = ref.putData(imageData, metadata);

      final String url = await (await uploadTask.onComplete).ref.getDownloadURL();

      store.dispatch(AddLiftImageSuccess(uuid: action.uuid, url: url));
    } catch (e) {
      store.dispatch(AddLiftImageFailure(error: e.toString()));
    }
  }

  void _deleteLiftImage(Store<AppState> store, DeleteLiftImage action, NextDispatcher next) async {
    next(action);

    try {
      final StorageReference ref = await FirebaseStorage.instance.getReferenceFromUrl(action.image.url);
      await ref.delete();
      store.dispatch(DeleteLiftImageSuccess());
    } catch (e) {
      store.dispatch(DeleteLiftImageFailure(error: e.toString()));
    }
  }

  void _postLead(Store<AppState> store, PostLiftLeadRequest action, NextDispatcher next) async {
    next(action);

    try {
      await repository.postLead(
        firstName: action.liftForm.firstName,
        lastName: action.liftForm.lastName,
        address: action.liftForm.address,
        postcode: action.liftForm.postcode,
        email: action.liftForm.email,
        status: 'postcode_not_covered',
        service: 'lift',
      );

      // Navifate to succes page then delete form data
      store.dispatch(LiftQuoteFormNextStep());
      store.dispatch(PostLiftLeadSuccess());
    } catch (e) {
      store.dispatch(PostLiftLeadFailure(error: e.toString()));
    }
  }

  void _submitForm(Store<AppState> store, SubmitLiftQuoteFormRequest action, NextDispatcher next) async {
    next(action);

    final LiftQuoteForm form = store.state.liftQuoteFormState.liftQuoteForm;

    final Completer _createUserCompleter = Completer();

    store.dispatch(CreateUserRequest(email: form.email, password: form.password, completer: _createUserCompleter));

    _createUserCompleter.future.then((userId) {
      final Completer _createCustomerCompleter = Completer();

      store.dispatch(CreateCustomerRequest(
        firstName: form.firstName,
        lastName: form.lastName,
        address: form.address,
        postcode: form.postcode,
        userId: userId,
        completer: _createCustomerCompleter,
      ));
      _createCustomerCompleter.future.then((customerId) {
        final Completer _createLiftCompleter = Completer();

        store.dispatch(CreateLiftRequest(
            customerId: customerId,
            floor: form.floor,
            elevator: form.elevator,
            customerNote: form.note,
            completer: _createLiftCompleter));
        _createLiftCompleter.future.then((liftId) {
          List<Completer> _imageCompleters = <Completer>[];
          form.images.forEach((String uuid, LiftImage image) {
            final Completer _currentImageCompleter = Completer();

            store.dispatch(CreateLiftImageRequest(
                liftId: liftId, url: image.url, uuid: image.uuid, completer: _currentImageCompleter));

            _imageCompleters.add(_currentImageCompleter);
          });

          Future.wait(List.generate(_imageCompleters.length, (int index) => _imageCompleters[index].future)).then((_) {
            store.dispatch(AppStarted());
            store.dispatch(SubmitLiftQuoteFormSuccess());
          }).catchError((dynamic e) => store.dispatch(SubmitLiftQuoteFormFailure(error: e.toString())));
        }).catchError((dynamic e) => store.dispatch(SubmitLiftQuoteFormFailure(error: e.toString())));
      }).catchError((dynamic e) => store.dispatch(SubmitLiftQuoteFormFailure(error: e.toString())));
    }).catchError((dynamic e) => store.dispatch(SubmitLiftQuoteFormFailure(error: e.toString())));
  }
}
