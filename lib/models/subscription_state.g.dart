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
      pickups: (json['pickups'] as List)
          ?.map((e) =>
              e == null ? null : Pickup.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      error: json['error'] as String);
}

Map<String, dynamic> _$SubscriptionStateToJson(SubscriptionState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'subscription': instance.subscription,
      'pickups': instance.pickups,
      'error': instance.error
    };
