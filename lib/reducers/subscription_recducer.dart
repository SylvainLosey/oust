import 'package:redux/redux.dart';

import '../actions/subscription_actions.dart';
import '../models/subscription_state.dart';



Reducer<SubscriptionState> subscriptionReducer = combineReducers([
  TypedReducer<SubscriptionState, LoadSubscriptionAction>(_loadSubscriptionAction),
  TypedReducer<SubscriptionState, LoadSubscriptionSuccess>(_loadSubscriptionSuccess),
  TypedReducer<SubscriptionState, LoadSubscriptionFailure>(_loadSubscriptionFailure),
]);

SubscriptionState _loadSubscriptionAction(SubscriptionState state, LoadSubscriptionAction action) {
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