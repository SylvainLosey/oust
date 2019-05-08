library SubscriptionState;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/consumer_subscription.dart';
import '../../data/models/serializers.dart';
import '../../data/models/subscription.dart';

part 'subscription_state.g.dart';


abstract class SubscriptionState implements Built<SubscriptionState, SubscriptionStateBuilder> {
  static Serializer<SubscriptionState> get serializer => _$subscriptionStateSerializer;
  factory SubscriptionState() => _$SubscriptionState((b) => b
    ..fetchCount = 0
  );

  SubscriptionState._();
  
  @nullable
  ConsumerSubscription get consumerSubscription;
  
  @nullable
  String get error;

  int get fetchCount;

  @nullable
  Subscription get subscription;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SubscriptionState.serializer, this);
  }

  static SubscriptionState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(SubscriptionState.serializer, jsonString);
  }
}