import 'dart:async';

import 'package:redux/redux.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'lift_quote_form_actions.dart';
import '../../../auth/auth_actions.dart';
import '../../../app/app_state.dart';
import '../../../../data/models/lift_quote_form.dart';
import '../../../../data/repository.dart';

class LiftQuoteFormMiddleware {
  final Repository repository;
  const LiftQuoteFormMiddleware(this.repository);

  List<Middleware<AppState>> createLiftQuoteFormMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, AddLiftImage>(_addLiftImage),
      TypedMiddleware<AppState, DeleteLiftImage>(_deleteLiftImage),
      TypedMiddleware<AppState, PostLiftLeadRequest>(_postLead),
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
}
