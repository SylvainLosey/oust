import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'pickup.dart';
import 'subscription.dart';

part 'subscription_state.g.dart';

@JsonSerializable()
@immutable
class SubscriptionState {
  final bool isLoading;
  final Subscription subscription;
  final List<Pickup> pickups;
  final String error;

  SubscriptionState({
    @required this.isLoading,
    @required this.subscription,
    @required this.pickups,
    @required this.error,
  });

  factory SubscriptionState.fromJson(Map<String, dynamic> json) => _$SubscriptionStateFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionStateToJson(this);

  factory SubscriptionState.initial() {
    return SubscriptionState(
      isLoading: true,
      subscription: null,
      pickups: null,
      error: null,
    );
  }

  SubscriptionState copyWith({
    bool isLoading,
    Subscription subscription,
    List<Pickup> pickups,
    String error
  }) {
    return SubscriptionState(
      isLoading: isLoading ?? this.isLoading,
      subscription: subscription ?? this.subscription,
      pickups: pickups ?? this.pickups,
      error: error ?? this.error,
    );
  }
}