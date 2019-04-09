library consumer_subscription;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'consumer_subscription.g.dart';

abstract class ConsumerSubscription implements Built<ConsumerSubscription, ConsumerSubscriptionBuilder> {
  ConsumerSubscription._();

  factory ConsumerSubscription([updates(ConsumerSubscriptionBuilder b)]) =_$ConsumerSubscription;

  @nullable
  int get subscription;
  @nullable
  int get package;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ConsumerSubscription.serializer, this);
  }

  static ConsumerSubscription fromJson(Map<String,dynamic> jsonString) {
    return serializers.deserializeWith(
        ConsumerSubscription.serializer, jsonString);
  }

  static Serializer<ConsumerSubscription> get serializer =>_$consumerSubscriptionSerializer;
}
