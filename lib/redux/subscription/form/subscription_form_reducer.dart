import 'package:oust/ui/subscription/form/page/100_postcode_unavailable.dart';
import 'package:oust/ui/subscription/form/page/200_appointment_requested.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';

import 'subscription_form_actions.dart';
import 'subscription_form_state.dart';
import '../../../data/models/subscription_form.dart';
import '../../../ui/subscription/form/page/subscription_form_pages.dart';

Reducer<SubscriptionFormState> subscriptionFormReducer = combineReducers([
  TypedReducer<SubscriptionFormState, SubscriptionFormStart>(_start),
  TypedReducer<SubscriptionFormState, SubscriptionFormNextStep>(_nextStep),
  TypedReducer<SubscriptionFormState, SubscriptionFormPreviousStep>(_previousStep),
  TypedReducer<SubscriptionFormState, UpdateSubscriptionForm>(_update),
  TypedReducer<SubscriptionFormState, PostLeadRequest>(_postLeadRequest),
  TypedReducer<SubscriptionFormState, PostLeadSuccess>(_postLeadSuccess),
  TypedReducer<SubscriptionFormState, PostLeadFailure>(_postLeadFailure),
  TypedReducer<SubscriptionFormState, LoadStartDatesRequest>(_loadStartDatesRequest),
  TypedReducer<SubscriptionFormState, LoadStartDatesSuccess>(_loadStartDatesSuccess),
  TypedReducer<SubscriptionFormState, LoadStartDatesFailure>(_loadStartDatesFailure),
  TypedReducer<SubscriptionFormState, IncrementProductQuantity>(_increment),
  TypedReducer<SubscriptionFormState, DecrementProductQuantity>(_decrement),
  TypedReducer<SubscriptionFormState, SubmitSubscriptionFormRequest>(_submitFormRequest),
  TypedReducer<SubscriptionFormState, SubmitSubscriptionFormSuccess>(_submitFormSuccess),
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
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = SubscriptionFormLead.step))
    );
  } else if (action.customerRequestsAppointment) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = SubscriptionFormAppointment.step))
    );
  } else if (action.doesNotWantContainers) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = SubscriptionFormLocation.step))
    );
  } else {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = state.subscriptionForm.currentStep + 1))
  );
  }
}

SubscriptionFormState _previousStep(SubscriptionFormState state, SubscriptionFormPreviousStep action) {
  if (state.subscriptionForm.currentStep == SubscriptionFormLead.step) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = SubscriptionFormAddress.step))
    );
  } else if (state.subscriptionForm.currentStep == SubscriptionFormAppointment.step) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = SubscriptionFormRegistrationMethod.step))
    ); 
  } else if (state.subscriptionForm.currentStep == SubscriptionFormLocation.step && !state.subscriptionForm.wantsContainers) {
    return state.rebuild((SubscriptionFormStateBuilder b) => b
      ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..currentStep = SubscriptionFormContainersYesNo.step))
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


SubscriptionFormState _loadStartDatesRequest(SubscriptionFormState state, LoadStartDatesRequest action) {
  return state.rebuild((SubscriptionFormStateBuilder b) => b
    ..isLoading = true
  );
}

SubscriptionFormState _loadStartDatesSuccess(SubscriptionFormState state, LoadStartDatesSuccess action) {
  return state.rebuild((SubscriptionFormStateBuilder b) => b
    ..isLoading = false
    ..subscriptionForm.replace(state.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b
      ..startDates.replace(action.startDates)
      ..selectedStartDate = null
    ))
  );
}

SubscriptionFormState _loadStartDatesFailure(SubscriptionFormState state, LoadStartDatesFailure action) {
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

SubscriptionFormState _submitFormRequest(SubscriptionFormState state, SubmitSubscriptionFormRequest action) {
  return state.rebuild((SubscriptionFormStateBuilder b) => b
    ..isLoading = true
  );
}

SubscriptionFormState _submitFormSuccess(SubscriptionFormState state, SubmitSubscriptionFormSuccess action) {
  return SubscriptionFormState();
}
