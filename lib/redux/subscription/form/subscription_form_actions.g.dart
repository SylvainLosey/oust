// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_form_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionFormNextStep _$SubscriptionFormNextStepFromJson(
    Map<String, dynamic> json) {
  return SubscriptionFormNextStep(
      subscriptionIsUnavailable: json['subscriptionIsUnavailable'] as bool,
      customerRequestsAppointment: json['customerRequestsAppointment'] as bool,
      doesNotWantContainers: json['doesNotWantContainers'] as bool);
}

Map<String, dynamic> _$SubscriptionFormNextStepToJson(
        SubscriptionFormNextStep instance) =>
    <String, dynamic>{
      'subscriptionIsUnavailable': instance.subscriptionIsUnavailable,
      'customerRequestsAppointment': instance.customerRequestsAppointment,
      'doesNotWantContainers': instance.doesNotWantContainers
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

LoadStartDatesRequest _$LoadStartDatesRequestFromJson(
    Map<String, dynamic> json) {
  return LoadStartDatesRequest(
      address: json['address'] as String,
      postcode: json['postcode'] as int,
      frequency: json['frequency'] as int);
}

Map<String, dynamic> _$LoadStartDatesRequestToJson(
        LoadStartDatesRequest instance) =>
    <String, dynamic>{
      'address': instance.address,
      'postcode': instance.postcode,
      'frequency': instance.frequency
    };

LoadStartDatesSuccess _$LoadStartDatesSuccessFromJson(
    Map<String, dynamic> json) {
  return LoadStartDatesSuccess(
      startDates: (json['startDates'] as List)
          ?.map((e) => e == null ? null : DateTime.parse(e as String))
          ?.toList());
}

Map<String, dynamic> _$LoadStartDatesSuccessToJson(
        LoadStartDatesSuccess instance) =>
    <String, dynamic>{
      'startDates':
          instance.startDates?.map((e) => e?.toIso8601String())?.toList()
    };

LoadStartDatesFailure _$LoadStartDatesFailureFromJson(
    Map<String, dynamic> json) {
  return LoadStartDatesFailure(error: json['error'] as String);
}

Map<String, dynamic> _$LoadStartDatesFailureToJson(
        LoadStartDatesFailure instance) =>
    <String, dynamic>{'error': instance.error};

IncrementProductQuantity _$IncrementProductQuantityFromJson(
    Map<String, dynamic> json) {
  return IncrementProductQuantity(product: json['product'] as String);
}

Map<String, dynamic> _$IncrementProductQuantityToJson(
        IncrementProductQuantity instance) =>
    <String, dynamic>{'product': instance.product};

DecrementProductQuantity _$DecrementProductQuantityFromJson(
    Map<String, dynamic> json) {
  return DecrementProductQuantity(product: json['product'] as String);
}

Map<String, dynamic> _$DecrementProductQuantityToJson(
        DecrementProductQuantity instance) =>
    <String, dynamic>{'product': instance.product};

SubmitSubscriptionFormRequest _$SubmitSubscriptionFormRequestFromJson(
    Map<String, dynamic> json) {
  return SubmitSubscriptionFormRequest();
}

Map<String, dynamic> _$SubmitSubscriptionFormRequestToJson(
        SubmitSubscriptionFormRequest instance) =>
    <String, dynamic>{};

SubmitSubscriptionFormSuccess _$SubmitSubscriptionFormSuccessFromJson(
    Map<String, dynamic> json) {
  return SubmitSubscriptionFormSuccess();
}

Map<String, dynamic> _$SubmitSubscriptionFormSuccessToJson(
        SubmitSubscriptionFormSuccess instance) =>
    <String, dynamic>{};

SubmitSubscriptionFormFailure _$SubmitSubscriptionFormFailureFromJson(
    Map<String, dynamic> json) {
  return SubmitSubscriptionFormFailure(error: json['error'] as String);
}

Map<String, dynamic> _$SubmitSubscriptionFormFailureToJson(
        SubmitSubscriptionFormFailure instance) =>
    <String, dynamic>{'error': instance.error};

SubscriptionFormReset _$SubscriptionFormResetFromJson(
    Map<String, dynamic> json) {
  return SubscriptionFormReset();
}

Map<String, dynamic> _$SubscriptionFormResetToJson(
        SubscriptionFormReset instance) =>
    <String, dynamic>{};
