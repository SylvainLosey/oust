// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionState _$SubscriptionStateFromJson(Map<String, dynamic> json) {
  return SubscriptionState(
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
      consumerSubscription: json['consumerSubscription'] == null
          ? null
          : ConsumerSubscription.fromJson(
              json['consumerSubscription'] as Map<String, dynamic>),
      packages: (json['packages'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(
            k, e == null ? null : Package.fromJson(e as Map<String, dynamic>)),
      ),
      fetchCount: json['fetchCount'] as int,
      error: json['error'] as String);
}

Map<String, dynamic> _$SubscriptionStateToJson(SubscriptionState instance) =>
    <String, dynamic>{
      'subscription': instance.subscription,
      'consumerSubscription': instance.consumerSubscription,
      'packages': instance.packages,
      'fetchCount': instance.fetchCount,
      'error': instance.error
    };
