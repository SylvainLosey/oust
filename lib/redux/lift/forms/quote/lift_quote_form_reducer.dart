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
]);

LiftQuoteFormState _start(LiftQuoteFormState state, LiftQuoteFormStart action) {
  if (state.liftQuoteForm.currentStep == 0) {
    return state.rebuild((b) => b..liftQuoteForm.replace(state.liftQuoteForm.rebuild((b) => b..currentStep = 1)));
  } else {
    return state;
  }
}

LiftQuoteFormState _nextStep(LiftQuoteFormState state, LiftQuoteFormNextStep action) {
  return state.rebuild((b) => b
    ..liftQuoteForm
        .replace((state.liftQuoteForm.rebuild((b) => b..currentStep = state.liftQuoteForm.currentStep + 1))));
}

LiftQuoteFormState _previousStep(LiftQuoteFormState state, LiftQuoteFormPreviousStep action) {
  return state.rebuild((b) => b
    ..liftQuoteForm.replace(state.liftQuoteForm.rebuild((b) => b..currentStep = state.liftQuoteForm.currentStep - 1)));
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
