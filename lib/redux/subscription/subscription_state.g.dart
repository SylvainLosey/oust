// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionState _$SubscriptionStateFromJson(Map<String, dynamic> json) {
  return SubscriptionState(
      isLoading: json['isLoading'] as bool,
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(json['subscription'] as List),
      error: json['error'] as String);
}

Map<String, dynamic> _$SubscriptionStateToJson(SubscriptionState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'subscription': instance.subscription,
      'error': instance.error
    };
