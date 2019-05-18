import 'package:redux/redux.dart';

import '../../data/models/lift_image.dart';
import '../../data/models/lift_quote_form.dart';

import 'forms/quote/lift_quote_form_reducer.dart';
import 'lift_state.dart';

LiftState liftReducer(LiftState state, dynamic action) {
  return state.rebuild((b) => b..liftQuoteFormState.replace(liftQuoteFormReducer(state.liftQuoteFormState, action)));
}
