library consumer_subscription;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'consumer_subscription.g.dart';

abstract class ConsumerSubscription implements Built<ConsumerSubscription, ConsumerSubscriptionBuilder> {
  static Serializer<ConsumerSubscription> get serializer =>_$consumerSubscriptionSerializer;

  factory ConsumerSubscription([updates(ConsumerSubscriptionBuilder b)]) =_$ConsumerSubscription;

  ConsumerSubscription._();
  @nullable
  int get package;

  @nullable
  int get subscription;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ConsumerSubscription.serializer, this);
  }

  static ConsumerSubscription fromJson(Map<String,dynamic> jsonString) {
    return serializers.deserializeWith(
        ConsumerSubscription.serializer, jsonString);
  }
}
