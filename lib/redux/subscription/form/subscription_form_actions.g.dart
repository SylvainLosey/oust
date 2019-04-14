// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_form_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionFormNextStep _$SubscriptionFormNextStepFromJson(
    Map<String, dynamic> json) {
  return SubscriptionFormNextStep();
}

Map<String, dynamic> _$SubscriptionFormNextStepToJson(
        SubscriptionFormNextStep instance) =>
    <String, dynamic>{};

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
