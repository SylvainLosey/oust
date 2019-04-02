import 'package:redux/redux.dart';

import 'subscription_actions.dart';
import 'subscription_state.dart';


Reducer<SubscriptionState> subscriptionReducer = combineReducers([
  TypedReducer<SubscriptionState, LoadSubscriptionRequest>(_loadSubscriptionRequest),
  TypedReducer<SubscriptionState, LoadSubscriptionSuccess>(_loadSubscriptionSuccess),
  TypedReducer<SubscriptionState, LoadSubscriptionFailure>(_loadSubscriptionFailure),
]);

SubscriptionState _loadSubscriptionRequest(SubscriptionState state, LoadSubscriptionRequest action) {
  return state.copyWith(
    isLoading: true,
  );
}

SubscriptionState _loadSubscriptionSuccess(SubscriptionState state, LoadSubscriptionSuccess action) {
  return state.copyWith(
    isLoading: false,
    subscription: action.subscription,
  );
}

SubscriptionState _loadSubscriptionFailure(SubscriptionState state, LoadSubscriptionFailure action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
  );
}
