import 'package:redux/redux.dart';

import '../actions/customer_actions.dart';
import '../actions/subscription_actions.dart';
import '../models/app_state.dart';
import '../models/customer.dart';
import '../models/subscription.dart';

import '../services/repository.dart';

class AppMiddleware {
  final Repository repository;

  const AppMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createAppMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, dynamic>(_logAction),
      TypedMiddleware<AppState, LoadCustomerAction>(_loadCustomer),
      TypedMiddleware<AppState, LoadSubscriptionAction>(_loadSubscription),
    ];
  }

  void _logAction(Store<AppState> store, dynamic action, NextDispatcher next) {
    print(action);
    next(action);
  }

  void _loadCustomer(Store<AppState> store, LoadCustomerAction action, NextDispatcher next) async{
    next(action);

    try {
      final Map<String, dynamic> customerData = await repository.fetchCustomer(action.user.id);

      final Customer customer = Customer.fromJson(customerData);

      store.dispatch(LoadCustomerSuccess(customer: customer));
      store.dispatch(LoadSubscriptionAction(customer: customer));

    } catch (e) {
      store.dispatch(LoadCustomerFailure(error: e.toString()));
    }
  }

  void _loadSubscription(Store<AppState> store, LoadSubscriptionAction action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> subscriptionData = await repository.fetchSubscription(action.customer.id);
      store.dispatch(LoadSubscriptionSuccess(subscription: Subscription.fromJson(subscriptionData)));
    } catch (e) {
      store.dispatch(LoadSubscriptionFailure(error: e.toString()));
    }
  }
}