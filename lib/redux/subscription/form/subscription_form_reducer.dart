import 'package:redux/redux.dart';

import 'subscription_form_actions.dart';
import 'subscription_form_state.dart';


Reducer<SubscriptionFormState> subscriptionFormReducer = combineReducers([
  TypedReducer<SubscriptionFormState, SubscriptionFormStart>(_start),
  TypedReducer<SubscriptionFormState, SubscriptionFormNextStep>(_nextStep),
  TypedReducer<SubscriptionFormState, SubscriptionFormPreviousStep>(_previousStep),
  TypedReducer<SubscriptionFormState, UpdateSubscriptionForm>(_update),
]);

SubscriptionFormState _start(SubscriptionFormState state, SubscriptionFormStart action) {

  // If user has never started the form (step 0), increment to page 1, otherwise leave him to current step
  if (state.subscriptionForm.currentStep == 0) {
    return state.rebuild((b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((b) => b..currentStep = state.subscriptionForm.currentStep + 1))
    );
  } else {
    return state;
  }
}

SubscriptionFormState _nextStep(SubscriptionFormState state, SubscriptionFormNextStep action) {
  if (action.subscriptionIsUnavailable) {
    return state.rebuild((b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((b) => b..currentStep = 100))
    );
  } else {
    return state.rebuild((b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((b) => b..currentStep = state.subscriptionForm.currentStep + 1))
  );
  }
}

SubscriptionFormState _previousStep(SubscriptionFormState state, SubscriptionFormPreviousStep action) {
  // If user goes back from Postode unavailable, set to previous track
  if (state.subscriptionForm.currentStep == 100) {
    return state.rebuild((b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((b) => b..currentStep = 4))
    );
  }

  return state.rebuild((b) => b
    ..subscriptionForm.replace(state.subscriptionForm.rebuild((b) => b..currentStep = state.subscriptionForm.currentStep - 1))
  );
}

SubscriptionFormState _update(SubscriptionFormState state, UpdateSubscriptionForm action) {
  return state.rebuild((b) => b
    ..subscriptionForm.replace(action.subscriptionForm)
  );
}
