import 'package:redux/redux.dart';

import 'subscription_form_actions.dart';
import 'subscription_form_state.dart';


Reducer<SubscriptionFormState> subscriptionFormReducer = combineReducers([
  TypedReducer<SubscriptionFormState, SubscriptionFormNextStep>(_nextStep),
  TypedReducer<SubscriptionFormState, SubscriptionFormPreviousStep>(_previousStep),
]);

SubscriptionFormState _nextStep(SubscriptionFormState state, SubscriptionFormNextStep action) {
  return state.rebuild((b) => b
    ..subscriptionForm.replace(state.subscriptionForm.rebuild((b) => b..currentStep = state.subscriptionForm.currentStep + 1))
  );
}

SubscriptionFormState _previousStep(SubscriptionFormState state, SubscriptionFormPreviousStep action) {
  return state.rebuild((b) => b
    ..subscriptionForm.replace(state.subscriptionForm.rebuild((b) => b..currentStep = state.subscriptionForm.currentStep - 1))
  );
}
