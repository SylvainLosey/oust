import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../data/models/pickup.dart';
import '../../data/models/subscription.dart';

part 'subscription_state.g.dart';

@JsonSerializable()
@immutable
class SubscriptionState {
  final bool isLoading;
  final Subscription subscription;
  final String error;

  SubscriptionState({
    @required this.isLoading,
    @required this.subscription,
    @required this.error,
  });

  factory SubscriptionState.fromJson(Map<String, dynamic> json) => _$SubscriptionStateFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionStateToJson(this);

  factory SubscriptionState.initial() {
    return SubscriptionState(
      isLoading: true,
      subscription: null,
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
      error: error ?? this.error,
    );
  }
}