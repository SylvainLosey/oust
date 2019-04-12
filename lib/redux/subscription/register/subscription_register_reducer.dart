import 'package:redux/redux.dart';

import 'subscription_register_actions.dart';
import 'subscription_register_state.dart';


Reducer<SubscriptionRegisterState> subscriptionRegisterReducer = combineReducers([
  TypedReducer<SubscriptionRegisterState, SubscriptionRegisterNextStep>(_nextStep),
  TypedReducer<SubscriptionRegisterState, SubscriptionRegisterPreviousStep>(_previousStep),
]);

SubscriptionRegisterState _nextStep(SubscriptionRegisterState state, SubscriptionRegisterNextStep action) {
  return state.rebuild((b) => b
    ..subscriptionRegister.replace(state.subscriptionRegister.rebuild((b) => b..currentStep = state.subscriptionRegister.currentStep + 1))
  );
}

SubscriptionRegisterState _previousStep(SubscriptionRegisterState state, SubscriptionRegisterPreviousStep action) {
  return state.rebuild((b) => b
    ..subscriptionRegister.replace(state.subscriptionRegister.rebuild((b) => b..currentStep = state.subscriptionRegister.currentStep - 1))
  );
}
