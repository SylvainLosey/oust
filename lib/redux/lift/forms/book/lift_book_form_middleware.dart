import 'dart:async';

import 'package:redux/redux.dart';

import 'lift_book_form_actions.dart';
import '../../../auth/auth_actions.dart';
import '../../lift_actions.dart';
import '../../../../data/models/lift_book_form.dart';
import '../../../../data/models/lift.dart';
import '../../../app/app_state.dart';
import '../../../../data/repository.dart';

class LiftBookFormMiddleware {
  final Repository repository;
  const LiftBookFormMiddleware(this.repository);

  List<Middleware<AppState>> createLiftBookFormMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, LiftBookFormStart>(_loadLiftSlots),
      TypedMiddleware<AppState, SubmitLiftBookFormRequest>(_submitForm)
    ];
  }

  void _loadLiftSlots(Store<AppState> store, LiftBookFormStart action, NextDispatcher next) async {
    next(action);

    try {
      final dynamic data = await repository.fetchLiftSlots(store.state.liftState.selectedId);
      final List<DateTime> liftSlots = List<DateTime>.from(data.map<dynamic>((dynamic x) => DateTime.parse(x)));
      store.dispatch(LoadLiftSlotsSuccess(liftSlots: liftSlots));
    } catch (e) {
      store.dispatch(LoadLiftSlotsFailure(error: e.toString()));
    }
  }

  void _submitForm(Store<AppState> store, SubmitLiftBookFormRequest action, NextDispatcher next) async {
    next(action);

    final LiftBookForm form = store.state.liftBookFormState.liftBookForm;
    final Lift lift =
        store.state.liftState.lifts[store.state.liftState.selectedId].rebuild((b) => b..status = 'SCHEDULED');

    final Completer _createLiftEventCompleter = Completer();
    final Completer _updateLiftEventCompleter = Completer();
    final List<Future> completers = <Future>[_createLiftEventCompleter.future, _updateLiftEventCompleter.future];

    store.dispatch(CreateLiftEventRequest(
        flexible: form.flexible,
        selectedLiftSlot: form.selectedLiftSlot,
        lift: lift,
        completer: _createLiftEventCompleter));

    store.dispatch(UpdateLiftRequest(lift: lift, completer: _updateLiftEventCompleter));

    Future.wait(completers).then((_) {
      store.dispatch(AppStarted());
      store.dispatch(SubmitLiftBookFormSuccess());
    }).catchError((dynamic e) => store.dispatch(SubmitLiftBookFormFailure(error: e.toString())));
  }
}
