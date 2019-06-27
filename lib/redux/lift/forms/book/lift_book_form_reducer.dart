import 'package:redux/redux.dart';

import 'lift_book_form_actions.dart';
import 'lift_book_form_state.dart';
import '../../../../data/models/lift_book_form.dart';

Reducer<LiftBookFormState> liftBookFormReducer = combineReducers([
  TypedReducer<LiftBookFormState, LiftBookFormStart>(_start),
  TypedReducer<LiftBookFormState, LiftBookFormNextStep>(_nextStep),
  TypedReducer<LiftBookFormState, LiftBookFormPreviousStep>(_previousStep),
  TypedReducer<LiftBookFormState, UpdateLiftBookForm>(_update),
  TypedReducer<LiftBookFormState, LoadLiftSlotsSuccess>(_loadLiftSlotsSuccess),
  TypedReducer<LiftBookFormState, LoadLiftSlotsFailure>(_loadLiftSlotsFailure),
  TypedReducer<LiftBookFormState, SubmitLiftBookFormRequest>(_submitFormRequest),
  TypedReducer<LiftBookFormState, SubmitLiftBookFormSuccess>(_submitFormSuccess),
  TypedReducer<LiftBookFormState, SubmitLiftBookFormFailure>(_submitFormFailure),
]);

LiftBookFormState _start(LiftBookFormState state, LiftBookFormStart action) {
  if (state.liftBookForm.currentStep == 0) {
    return state.rebuild((b) => b..liftBookForm.replace(state.liftBookForm.rebuild((b) => b..currentStep = 1)));
  } else {
    return state;
  }
}

LiftBookFormState _nextStep(LiftBookFormState state, LiftBookFormNextStep action) {
  return state.rebuild((b) => b
    ..liftBookForm.replace((state.liftBookForm.rebuild((b) => b..currentStep = state.liftBookForm.currentStep + 1))));
}

LiftBookFormState _previousStep(LiftBookFormState state, LiftBookFormPreviousStep action) {
  return state.rebuild((b) =>
      b..liftBookForm.replace(state.liftBookForm.rebuild((b) => b..currentStep = state.liftBookForm.currentStep - 1)));
}

LiftBookFormState _update(LiftBookFormState state, UpdateLiftBookForm action) {
  return state.rebuild((LiftBookFormStateBuilder b) => b..liftBookForm.replace(action.liftBookForm));
}

LiftBookFormState _loadLiftSlotsSuccess(LiftBookFormState state, LoadLiftSlotsSuccess action) {
  return state.rebuild((b) => b
    ..isLoading = false
    ..liftBookForm.replace(state.liftBookForm.rebuild((b) => b
      ..liftSlots.replace(action.liftSlots)
      ..selectedLiftSlot = null)));
}

LiftBookFormState _loadLiftSlotsFailure(LiftBookFormState state, LoadLiftSlotsFailure action) {
  return state.rebuild((b) => b
    ..isLoading = false
    ..error = action.error);
}

LiftBookFormState _submitFormRequest(LiftBookFormState state, SubmitLiftBookFormRequest action) {
  return state.rebuild((b) => b..isLoading = true);
}

LiftBookFormState _submitFormSuccess(LiftBookFormState state, SubmitLiftBookFormSuccess action) {
  return LiftBookFormState();
}

LiftBookFormState _submitFormFailure(LiftBookFormState state, SubmitLiftBookFormFailure action) {
  return state.rebuild((b) => b
    ..isLoading = false
    ..error = action.error);
}
