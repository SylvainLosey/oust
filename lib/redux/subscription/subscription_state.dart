// import 'package:json_annotation/json_annotation.dart';
// import 'package:meta/meta.dart';

// import '../../data/models/pickup.dart';
// import '../../data/models/subscription.dart';
// import '../../data/models/consumer_subscription.dart';
// import '../../data/models/package.dart';

// part 'subscription_state.g.dart';

// @JsonSerializable()
// @immutable
// class SubscriptionState {
//   final Subscription subscription;
//   final ConsumerSubscription consumerSubscription;
//   final Map<dynamic, Package> packages;
//   final int fetchCount;
//   final String error;

//   SubscriptionState({
//     this.subscription,
//     this.consumerSubscription,
//     this.packages,
//     this.fetchCount,
//     this.error,
//   });

//   factory SubscriptionState.fromJson(Map<String, dynamic> json) => _$SubscriptionStateFromJson(json);
//   Map<String, dynamic> toJson() => _$SubscriptionStateToJson(this);

//   factory SubscriptionState.initial() {
//     return SubscriptionState(
//       subscription: null,
//       consumerSubscription: null,
//       packages: null,
//       fetchCount: 0,
//       error: null,
//     );
//   }

//   SubscriptionState copyWith({
//     Subscription subscription,
//     ConsumerSubscription consumerSubscription,
//     Map<dynamic, Package> packages,
//     int fetchCount,
//     String error
//   }) {
//     return SubscriptionState(
//       subscription: subscription ?? this.subscription,
//       consumerSubscription: consumerSubscription ?? this.consumerSubscription,
//       packages: packages ?? this.packages,
//       fetchCount: fetchCount ?? this.fetchCount,
//       error: error ?? this.error,
//     );
//   }
// }

library SubscriptionState;

import 'dart:convert';

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

  static SubscriptionState fromJson(String jsonString) {
    return serializers.deserializeWith(SubscriptionState.serializer, json.decode(jsonString));
  }

  static Serializer<SubscriptionState> get serializer => _$subscriptionStateSerializer;
}