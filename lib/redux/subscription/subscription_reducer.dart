import 'package:redux/redux.dart';

import 'subscription_actions.dart';
import 'subscription_state.dart';
import '../../data/models/package.dart';


Reducer<SubscriptionState> subscriptionReducer = combineReducers([
  TypedReducer<SubscriptionState, LoadSubscriptionRequest>(_loadSubscriptionRequest),
  TypedReducer<SubscriptionState, LoadSubscriptionSuccess>(_loadSubscriptionSuccess),
  TypedReducer<SubscriptionState, LoadSubscriptionFailure>(_loadSubscriptionFailure),
  TypedReducer<SubscriptionState, LoadConsumerSubscriptionRequest>(_loadConsumerSubscriptionRequest),
  TypedReducer<SubscriptionState, LoadConsumerSubscriptionSuccess>(_loadConsumerSubscriptionSuccess),
  TypedReducer<SubscriptionState, LoadConsumerSubscriptionFailure>(_loadConsumerSubscriptionFailure),
  TypedReducer<SubscriptionState, LoadPackagesRequest>(_loadPackagesRequest),
  TypedReducer<SubscriptionState, LoadPackagesSuccess>(_loadPackagesSuccess),
  TypedReducer<SubscriptionState, LoadPackagesFailure>(_loadPackagesFailure),
]);


/// SUBSCRIPTION

SubscriptionState _loadSubscriptionRequest(SubscriptionState state, LoadSubscriptionRequest action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount + 1
  );
}

SubscriptionState _loadSubscriptionSuccess(SubscriptionState state, LoadSubscriptionSuccess action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount -1
    ..subscription.replace(action.subscription)
  );
}

SubscriptionState _loadSubscriptionFailure(SubscriptionState state, LoadSubscriptionFailure action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount -1
    ..error = action.error
  );
}

/// CONSUMER SUBSCRIPTION

SubscriptionState _loadConsumerSubscriptionRequest(SubscriptionState state, LoadConsumerSubscriptionRequest action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount + 1
  );
}

SubscriptionState _loadConsumerSubscriptionSuccess(SubscriptionState state, LoadConsumerSubscriptionSuccess action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount -1
    ..consumerSubscription.replace(action.consumerSubscription)
  );
}

SubscriptionState _loadConsumerSubscriptionFailure(SubscriptionState state, LoadConsumerSubscriptionFailure action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount -1
    ..error = action.error
  );
}


/// PACKAGES

SubscriptionState _loadPackagesRequest(SubscriptionState state, LoadPackagesRequest action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount + 1
  );
}

SubscriptionState _loadPackagesSuccess(SubscriptionState state, LoadPackagesSuccess action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount -1
    ..packages.addAll(Map<int, Package>.fromIterable(
      action.packages,
      key: (dynamic package) => package.id,
      value: (dynamic package) => package,
    )),
  );
}

SubscriptionState _loadPackagesFailure(SubscriptionState state, LoadPackagesFailure action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount -1
    ..error = action.error
  );
}

