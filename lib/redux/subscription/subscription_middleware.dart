import 'package:redux/redux.dart';

import 'subscription_actions.dart';
import '../pickup/pickup_actions.dart';
import '../app/app_state.dart';
import '../../data/models/subscription.dart';
import '../../data/models/consumer_subscription.dart';
import '../../data/repository.dart';

class SubscriptionMiddleware {
  final Repository repository;
  const SubscriptionMiddleware(this.repository);

  List<Middleware<AppState>> createSubscriptionMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, LoadSubscriptionRequest>(_loadSubscription),
      TypedMiddleware<AppState, CreateSubscriptionRequest>(_createSubscriptionRequest),
      TypedMiddleware<AppState, LoadConsumerSubscriptionRequest>(_loadConsumerSubscription),
      TypedMiddleware<AppState, CreateConsumerSubscriptionRequest>(
          _createConsumerSubscriptionRequest),
    ];
  }

  void _loadSubscription(
      Store<AppState> store, LoadSubscriptionRequest action, NextDispatcher next) async {
    next(action);

    try {
      final List<dynamic> subscriptionData = await repository.fetchSubscription(action.customer.id);
      final Subscription subscription = Subscription.fromJson(subscriptionData[0]);
      store.dispatch(LoadSubscriptionSuccess(subscription: subscription));
      store.dispatch(LoadPickupsRequest(subscription: subscription));
    } catch (e) {
      store.dispatch(LoadSubscriptionFailure(error: e.toString()));
    }
  }

  void _createSubscriptionRequest(
      Store<AppState> store, CreateSubscriptionRequest action, NextDispatcher next) async {
    next(action);

    try {
      final Subscription subscription = Subscription((SubscriptionBuilder b) => b
        ..baseDate = action.baseDate
        ..note = action.note
        ..customer = action.customerId
        ..subscriptionType = 'P');

      final Map<String, dynamic> data = await repository.createSubscription(subscription);
      action.completer.complete(data['id']);
      store.dispatch(CreateSubscriptionSuccess());
    } catch (e) {
      store.dispatch(CreateSubscriptionFailure());
      action.completer.completeError(e.toString());
    }
  }

  void _loadConsumerSubscription(
      Store<AppState> store, LoadConsumerSubscriptionRequest action, NextDispatcher next) async {
    next(action);

    try {
      final List<dynamic> consumerSubscriptionData =
          await repository.fetchConsumerSubscription(action.customer.id);
      final ConsumerSubscription consumerSubscription =
          ConsumerSubscription.fromJson(consumerSubscriptionData[0]);
      store.dispatch(LoadConsumerSubscriptionSuccess(consumerSubscription: consumerSubscription));
    } catch (e) {
      store.dispatch(LoadConsumerSubscriptionFailure(error: e.toString()));
    }
  }

  void _createConsumerSubscriptionRequest(
      Store<AppState> store, CreateConsumerSubscriptionRequest action, NextDispatcher next) async {
    next(action);

    try {
      final ConsumerSubscription consumerSubscription =
          ConsumerSubscription((ConsumerSubscriptionBuilder b) => b
            ..package = action.packageId
            ..subscription = action.subscriptionId);

      final Map<String, dynamic> data =
          await repository.createConsumerSubscription(consumerSubscription);
      action.completer.complete();
      store.dispatch(CreateConsumerSubscriptionSuccess());
    } catch (e) {
      store.dispatch(CreateConsumerSubscriptionFailure(error: e.toString()));
      action.completer.completeError(e.toString());
    }
  }
}
