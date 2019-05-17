import 'package:redux/redux.dart';

import 'lift_quote_form_actions.dart';
import 'lift_quote_form_state.dart';
import '../../../data/models/lift_quote_form.dart';
import '../../../data/models/lift_image.dart';

LiftQuoteFormState liftQuoteFormStateReducer(LiftQuoteFormState state, dynamic action) {
  return state
      .rebuild((b) => b..liftQuoteForm.replace(liftQuoteFormReducer(state.liftQuoteForm, action)));
}

Reducer<LiftQuoteForm> liftQuoteFormReducer = combineReducers([
  TypedReducer<LiftQuoteForm, AddLiftImage>(_addLiftImage),
  TypedReducer<LiftQuoteForm, AddLiftImageSuccess>(_addLiftImageSuccess),
  TypedReducer<LiftQuoteForm, DeleteLiftImage>(_deleteLiftImage),
]);

LiftQuoteForm _addLiftImage(LiftQuoteForm state, AddLiftImage action) {
  return state.rebuild((b) => b
    ..images.addAll(<String, LiftImage>{
      action.uuid: LiftImage((LiftImageBuilder b) => b
        ..image = action.image
        ..uuid = action.uuid)
    }));
}

LiftQuoteForm _addLiftImageSuccess(LiftQuoteForm state, AddLiftImageSuccess action) {
  // WARNING for some reason you can't just call rebuild on b..images[action.uuid], you have to do the = ...
  return state.rebuild((b) =>
      b..images[action.uuid] = state.images[action.uuid].rebuild((b) => b..url = action.url));
}

LiftQuoteForm _deleteLiftImage(LiftQuoteForm state, DeleteLiftImage action) {
  return state.rebuild((b) => b..images.remove(action.image.uuid));
}
