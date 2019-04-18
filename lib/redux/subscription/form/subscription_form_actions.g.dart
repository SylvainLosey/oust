// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_form_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionFormNextStep _$SubscriptionFormNextStepFromJson(
    Map<String, dynamic> json) {
  return SubscriptionFormNextStep(
      subscriptionIsUnavailable: json['subscriptionIsUnavailable'] as bool,
      customerRequestsAppointment: json['customerRequestsAppointment'] as bool);
}

Map<String, dynamic> _$SubscriptionFormNextStepToJson(
        SubscriptionFormNextStep instance) =>
    <String, dynamic>{
      'subscriptionIsUnavailable': instance.subscriptionIsUnavailable,
      'customerRequestsAppointment': instance.customerRequestsAppointment
    };

SubscriptionFormPreviousStep _$SubscriptionFormPreviousStepFromJson(
    Map<String, dynamic> json) {
  return SubscriptionFormPreviousStep();
}

Map<String, dynamic> _$SubscriptionFormPreviousStepToJson(
        SubscriptionFormPreviousStep instance) =>
    <String, dynamic>{};

SubscriptionFormStart _$SubscriptionFormStartFromJson(
    Map<String, dynamic> json) {
  return SubscriptionFormStart();
}

Map<String, dynamic> _$SubscriptionFormStartToJson(
        SubscriptionFormStart instance) =>
    <String, dynamic>{};

SubscriptionFormExit _$SubscriptionFormExitFromJson(Map<String, dynamic> json) {
  return SubscriptionFormExit();
}

Map<String, dynamic> _$SubscriptionFormExitToJson(
        SubscriptionFormExit instance) =>
    <String, dynamic>{};

UpdateSubscriptionForm _$UpdateSubscriptionFormFromJson(
    Map<String, dynamic> json) {
  return UpdateSubscriptionForm(json['subscriptionForm'] == null
      ? null
      : SubscriptionForm.fromJson(
          json['subscriptionForm'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UpdateSubscriptionFormToJson(
        UpdateSubscriptionForm instance) =>
    <String, dynamic>{'subscriptionForm': instance.subscriptionForm};

PostLeadRequest _$PostLeadRequestFromJson(Map<String, dynamic> json) {
  return PostLeadRequest(json['subscriptionForm'] == null
      ? null
      : SubscriptionForm.fromJson(
          json['subscriptionForm'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PostLeadRequestToJson(PostLeadRequest instance) =>
    <String, dynamic>{'subscriptionForm': instance.subscriptionForm};

PostLeadSuccess _$PostLeadSuccessFromJson(Map<String, dynamic> json) {
  return PostLeadSuccess();
}

Map<String, dynamic> _$PostLeadSuccessToJson(PostLeadSuccess instance) =>
    <String, dynamic>{};

PostLeadFailure _$PostLeadFailureFromJson(Map<String, dynamic> json) {
  return PostLeadFailure(error: json['error'] as String);
}

Map<String, dynamic> _$PostLeadFailureToJson(PostLeadFailure instance) =>
    <String, dynamic>{'error': instance.error};
