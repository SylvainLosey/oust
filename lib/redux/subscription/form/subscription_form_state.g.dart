// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionFormState _$SubscriptionFormStateFromJson(
    Map<String, dynamic> json) {
  return SubscriptionFormState(
      subscriptionForm: json['subscriptionForm'] == null
          ? null
          : SubscriptionForm.fromJson(
              json['subscriptionForm'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool,
      error: json['error'] as String);
}

Map<String, dynamic> _$SubscriptionFormStateToJson(
        SubscriptionFormState instance) =>
    <String, dynamic>{
      'subscriptionForm': instance.subscriptionForm,
      'isLoading': instance.isLoading,
      'error': instance.error
    };
