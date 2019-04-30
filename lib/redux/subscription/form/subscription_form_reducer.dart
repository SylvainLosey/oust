import 'package:redux/redux.dart';

import 'subscription_form_actions.dart';
import 'subscription_form_state.dart';
import '../../../data/models/subscription_form.dart';


Reducer<SubscriptionFormState> subscriptionFormReducer = combineReducers([
  TypedReducer<SubscriptionFormState, SubscriptionFormStart>(_start),
  TypedReducer<SubscriptionFormState, SubscriptionFormNextStep>(_nextStep),
  TypedReducer<SubscriptionFormState, SubscriptionFormPreviousStep>(_previousStep),
  TypedReducer<SubscriptionFormState, UpdateSubscriptionForm>(_update),
  TypedReducer<SubscriptionFormState, PostLeadRequest>(_postLeadRequest),
  TypedReducer<SubscriptionFormState, PostLeadSuccess>(_postLeadSuccess),
  TypedReducer<SubscriptionFormState, PostLeadFailure>(_postLeadFailure),
  TypedReducer<SubscriptionFormState, IncrementProductQuantity>(_increment),
  TypedReducer<SubscriptionFormState, DecrementProductQuantity>(_decrement),
]);

SubscriptionFormState _start(SubscriptionFormState state, SubscriptionFormStart action) {

  // If user has never started the form (step 0), increment to page 1, otherwise leave him to current step
  if (state.subscriptionForm.currentStep == 0) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = state.subscriptionForm.currentStep + 1))
    );
  } else {
    return state;
  }
}

SubscriptionFormState _nextStep(SubscriptionFormState state, SubscriptionFormNextStep action) {
  if (action.subscriptionIsUnavailable) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = 100))
    );
  } else if (action.customerRequestsAppointment) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = 200))
    );
  } else if (action.doesNotWantContainers) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = 8))
    );
  } else {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = state.subscriptionForm.currentStep + 1))
  );
  }
}

SubscriptionFormState _previousStep(SubscriptionFormState state, SubscriptionFormPreviousStep action) {
  if (state.subscriptionForm.currentStep == 100) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = 4))
    );
  } else if (state.subscriptionForm.currentStep == 200) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = 5))
    ); 
  } else if (state.subscriptionForm.currentStep == 8 && !state.subscriptionForm.wantsContainers) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = 6))
    ); 
  } else {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = state.subscriptionForm.currentStep - 1))
    );
  }
}

SubscriptionFormState _update(SubscriptionFormState state, UpdateSubscriptionForm action) {
  return state.rebuild((SubscriptionFormStateBuilder b) => b
    ..subscriptionForm.replace(action.subscriptionForm)
  );
}

SubscriptionFormState _postLeadRequest(SubscriptionFormState state, PostLeadRequest action) {
  return state.rebuild((SubscriptionFormStateBuilder b) => b
    ..isLoading = true
  );
}

SubscriptionFormState _postLeadSuccess(SubscriptionFormState state, PostLeadSuccess action) {
  return state.rebuild((SubscriptionFormStateBuilder b) => b
    ..isLoading = false
    ..subscriptionForm.replace(SubscriptionForm())
  );
}

SubscriptionFormState _postLeadFailure(SubscriptionFormState state, PostLeadFailure action) {
  return state.rebuild((SubscriptionFormStateBuilder b) => b
    ..isLoading = false
    ..error = action.error
  );
}

SubscriptionFormState _increment(SubscriptionFormState state, IncrementProductQuantity action) {
  if (action.product == 'smallContainer') {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..smallContainerQuantity = state.subscriptionForm.smallContainerQuantity + 1))
    );
  } else if (action.product == 'bigContainer') {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..bigContainerQuantity = state.subscriptionForm.bigContainerQuantity + 1))
    ); 
  } else {
    return state;
  }
}

SubscriptionFormState _decrement(SubscriptionFormState state, DecrementProductQuantity action) {
  if (action.product == 'smallContainer' && state.subscriptionForm.smallContainerQuantity > 0) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..smallContainerQuantity = state.subscriptionForm.smallContainerQuantity - 1))
    );
  } else if (action.product == 'bigContainer' && state.subscriptionForm.bigContainerQuantity > 0) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..bigContainerQuantity = state.subscriptionForm.bigContainerQuantity - 1))
    ); 
  } else {
    return state;
  }
}