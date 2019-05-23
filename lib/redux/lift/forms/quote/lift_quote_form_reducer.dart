import 'package:oust/ui/lift/forms/quote/pages/lift_quote_form_pages.dart';
import 'package:redux/redux.dart';

import 'lift_quote_form_actions.dart';
import 'lift_quote_form_state.dart';
import '../../../../data/models/lift_quote_form.dart';
import '../../../../data/models/lift_image.dart';

Reducer<LiftQuoteFormState> liftQuoteFormReducer = combineReducers([
  TypedReducer<LiftQuoteFormState, LiftQuoteFormStart>(_start),
  TypedReducer<LiftQuoteFormState, LiftQuoteFormNextStep>(_nextStep),
  TypedReducer<LiftQuoteFormState, LiftQuoteFormPreviousStep>(_previousStep),
  TypedReducer<LiftQuoteFormState, UpdateLiftQuoteForm>(_update),
  TypedReducer<LiftQuoteFormState, AddLiftImage>(_addLiftImage),
  TypedReducer<LiftQuoteFormState, AddLiftImageSuccess>(_addLiftImageSuccess),
  TypedReducer<LiftQuoteFormState, DeleteLiftImage>(_deleteLiftImage),
  TypedReducer<LiftQuoteFormState, LiftQuoteFormIncrementFloor>(_incrementFloor),
  TypedReducer<LiftQuoteFormState, LiftQuoteFormDecrementFloor>(_decrementFloor),
  TypedReducer<LiftQuoteFormState, LiftQuoteFormToggleElevator>(_toggleElevator),
  TypedReducer<LiftQuoteFormState, PostLiftLeadRequest>(_postLeadRequest),
  TypedReducer<LiftQuoteFormState, PostLiftLeadSuccess>(_postLeadSuccess),
  TypedReducer<LiftQuoteFormState, PostLiftLeadFailure>(_postLeadFailure),
  TypedReducer<LiftQuoteFormState, SubmitLiftQuoteFormRequest>(_submitFormRequest),
  TypedReducer<LiftQuoteFormState, SubmitLiftQuoteFormSuccess>(_submitFormSuccess),
  TypedReducer<LiftQuoteFormState, SubmitLiftQuoteFormFailure>(_submitFormFailure),
]);

LiftQuoteFormState _start(LiftQuoteFormState state, LiftQuoteFormStart action) {
  if (state.liftQuoteForm.currentStep == 0) {
    return state.rebuild((b) => b..liftQuoteForm.replace(state.liftQuoteForm.rebuild((b) => b..currentStep = 1)));
  } else {
    return state;
  }
}

LiftQuoteFormState _nextStep(LiftQuoteFormState state, LiftQuoteFormNextStep action) {
  if (action.liftIsUnavailable) {
    return state.rebuild(
        (b) => b..liftQuoteForm.replace(state.liftQuoteForm.rebuild((b) => b..currentStep = LiftQuoteFormLead.step)));
  } else {
    return state.rebuild((b) => b
      ..liftQuoteForm
          .replace((state.liftQuoteForm.rebuild((b) => b..currentStep = state.liftQuoteForm.currentStep + 1))));
  }
}

LiftQuoteFormState _previousStep(LiftQuoteFormState state, LiftQuoteFormPreviousStep action) {
  if (state.liftQuoteForm.currentStep == LiftQuoteFormLead.step) {
    return state.rebuild((b) =>
        b..liftQuoteForm.replace(state.liftQuoteForm.rebuild((b) => b..currentStep = LiftQuoteFormAddress.step)));
  } else {
    return state.rebuild((b) => b
      ..liftQuoteForm
          .replace(state.liftQuoteForm.rebuild((b) => b..currentStep = state.liftQuoteForm.currentStep - 1)));
  }
}

LiftQuoteFormState _update(LiftQuoteFormState state, UpdateLiftQuoteForm action) {
  return state.rebuild((LiftQuoteFormStateBuilder b) => b..liftQuoteForm.replace(action.liftQuoteForm));
}

LiftQuoteFormState _addLiftImage(LiftQuoteFormState state, AddLiftImage action) {
  return state.rebuild((b) => b
    ..liftQuoteForm.replace(state.liftQuoteForm.rebuild((b) => b
      ..images.addAll(<String, LiftImage>{
        action.uuid: LiftImage((LiftImageBuilder b) => b
          ..image = action.image
          ..uuid = action.uuid)
      }))));
}

LiftQuoteFormState _addLiftImageSuccess(LiftQuoteFormState state, AddLiftImageSuccess action) {
  // WARNING for some reason you can't just call rebuild on b..images[action.uuid], you have to do the = ...
  return state.rebuild((b) => b
    ..liftQuoteForm.replace(state.liftQuoteForm.rebuild(
        (b) => b..images[action.uuid] = state.liftQuoteForm.images[action.uuid].rebuild((b) => b..url = action.url))));
}

LiftQuoteFormState _deleteLiftImage(LiftQuoteFormState state, DeleteLiftImage action) {
  return state.rebuild(
      (b) => b..liftQuoteForm.replace(state.liftQuoteForm.rebuild((b) => b..images.remove(action.image.uuid))));
}

LiftQuoteFormState _incrementFloor(LiftQuoteFormState state, LiftQuoteFormIncrementFloor action) {
  return state.rebuild(
      (b) => b..liftQuoteForm.replace(state.liftQuoteForm.rebuild((b) => b..floor = state.liftQuoteForm.floor + 1)));
}

LiftQuoteFormState _decrementFloor(LiftQuoteFormState state, LiftQuoteFormDecrementFloor action) {
  if (state.liftQuoteForm.floor > 0) {
    return state.rebuild(
        (b) => b..liftQuoteForm.replace(state.liftQuoteForm.rebuild((b) => b..floor = state.liftQuoteForm.floor - 1)));
  } else {
    return state;
  }
}

LiftQuoteFormState _toggleElevator(LiftQuoteFormState state, LiftQuoteFormToggleElevator action) {
  return state.rebuild(
      (b) => b..liftQuoteForm.replace(state.liftQuoteForm.rebuild((b) => b..elevator = !state.liftQuoteForm.elevator)));
}

LiftQuoteFormState _postLeadRequest(LiftQuoteFormState state, PostLiftLeadRequest action) {
  return state.rebuild((b) => b..isLoading = true);
}

LiftQuoteFormState _postLeadSuccess(LiftQuoteFormState state, PostLiftLeadSuccess action) {
  return state.rebuild((b) => b
    ..isLoading = false
    ..liftQuoteForm.replace(LiftQuoteForm()));
}

LiftQuoteFormState _postLeadFailure(LiftQuoteFormState state, PostLiftLeadFailure action) {
  return state.rebuild((b) => b
    ..isLoading = false
    ..error = action.error);
}

LiftQuoteFormState _submitFormRequest(LiftQuoteFormState state, SubmitLiftQuoteFormRequest action) {
  return state.rebuild((b) => b..isLoading = true);
}

LiftQuoteFormState _submitFormSuccess(LiftQuoteFormState state, SubmitLiftQuoteFormSuccess action) {
  return LiftQuoteFormState();
}

LiftQuoteFormState _submitFormFailure(LiftQuoteFormState state, SubmitLiftQuoteFormFailure action) {
  return state.rebuild((b) => b
    ..isLoading = false
    ..error = action.error);
}
