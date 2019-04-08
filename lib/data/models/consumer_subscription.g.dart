// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumer_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsumerSubscription _$ConsumerSubscriptionFromJson(Map<String, dynamic> json) {
  return ConsumerSubscription(
      subscription: json['subscription'] as int,
      package: json['package'] as int);
}

Map<String, dynamic> _$ConsumerSubscriptionToJson(
        ConsumerSubscription instance) =>
    <String, dynamic>{
      'subscription': instance.subscription,
      'package': instance.package
    };
