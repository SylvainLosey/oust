library SubscriptionState;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/pickup.dart';
import '../../data/models/subscription.dart';
import '../../data/models/consumer_subscription.dart';
import '../../data/models/package.dart';
import '../../data/models/serializers.dart';

part 'subscription_state.g.dart';


abstract class SubscriptionState implements Built<SubscriptionState, SubscriptionStateBuilder> {
  int get fetchCount;
  @nullable
  Subscription get subscription;
  @nullable
  ConsumerSubscription get consumerSubscription;
  @nullable
  BuiltMap<int, Package> get packages;
  @nullable
  String get error;

  SubscriptionState._();

  factory SubscriptionState([void Function(SubscriptionStateBuilder) updates]) => _$SubscriptionState((b) => b
    ..fetchCount = 0
  );

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SubscriptionState.serializer, this);
  }

  static SubscriptionState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(SubscriptionState.serializer, jsonString);
  }

  static Serializer<SubscriptionState> get serializer => _$subscriptionStateSerializer;
}