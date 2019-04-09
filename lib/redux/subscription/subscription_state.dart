import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../data/models/pickup.dart';
import '../../data/models/subscription.dart';
import '../../data/models/consumer_subscription.dart';
import '../../data/models/package.dart';

part 'subscription_state.g.dart';

@JsonSerializable()
@immutable
class SubscriptionState {
  final Subscription subscription;
  final ConsumerSubscription consumerSubscription;
  final Map<dynamic, Package> packages;
  final int fetchCount;
  final String error;

  SubscriptionState({
    this.subscription,
    this.consumerSubscription,
    this.packages,
    this.fetchCount,
    this.error,
  });

  factory SubscriptionState.fromJson(Map<String, dynamic> json) => _$SubscriptionStateFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionStateToJson(this);

  factory SubscriptionState.initial() {
    return SubscriptionState(
      subscription: null,
      consumerSubscription: null,
      packages: null,
      fetchCount: 0,
      error: null,
    );
  }

  SubscriptionState copyWith({
    Subscription subscription,
    ConsumerSubscription consumerSubscription,
    Map<dynamic, Package> packages,
    int fetchCount,
    String error
  }) {
    return SubscriptionState(
      subscription: subscription ?? this.subscription,
      consumerSubscription: consumerSubscription ?? this.consumerSubscription,
      packages: packages ?? this.packages,
      fetchCount: fetchCount ?? this.fetchCount,
      error: error ?? this.error,
    );
  }
}