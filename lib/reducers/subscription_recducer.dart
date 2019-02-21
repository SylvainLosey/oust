import 'package:redux/redux.dart';

import '../actions/subscription_actions.dart';
import '../models/subscription_state.dart';



Reducer<SubscriptionState> subscriptionReducer = combineReducers([
  TypedReducer<SubscriptionState, LoadSubscriptionAction>(_loadSubscriptionAction),
  TypedReducer<SubscriptionState, LoadSubscriptionSuccess>(_loadSubscriptionSuccess),
  TypedReducer<SubscriptionState, LoadSubscriptionFailure>(_loadSubscriptionFailure),
  TypedReducer<SubscriptionState, LoadPickupsAction>(_loadPickupsAction),
  TypedReducer<SubscriptionState, LoadPickupsSuccess>(_loadPickupsSuccess),
  TypedReducer<SubscriptionState, LoadPickupsFailure>(_loadPickupsFailure),
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

SubscriptionState _loadPickupsAction(SubscriptionState state, LoadPickupsAction action) {
  return state.copyWith(
    isLoading: true,
  );
}

SubscriptionState _loadPickupsSuccess(SubscriptionState state, LoadPickupsSuccess action) {
  return state.copyWith(
    isLoading: false,
    pickups: action.pickups,
  );
}

SubscriptionState _loadPickupsFailure(SubscriptionState state, LoadPickupsFailure action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
  );
}