import 'package:redux/redux.dart';

import '../../data/models/lift_image.dart';
import '../../data/models/lift_quote_form.dart';

import 'quote_form/lift_quote_form_reducer.dart';
import 'lift_state.dart';

LiftState liftReducer(LiftState state, dynamic action) {
  return state.rebuild((b) =>
      b..liftQuoteFormState.replace(liftQuoteFormStateReducer(state.liftQuoteFormState, action)));
}