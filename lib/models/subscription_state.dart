import 'package:meta/meta.dart';

import 'subscription.dart';

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
    String error
  }) {
    return SubscriptionState(
      isLoading: isLoading ?? this.isLoading,
      subscription: subscription ?? this.subscription,
      error: error ?? this.error,
    );
  }
}