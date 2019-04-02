import 'package:redux/redux.dart';

import '../customer/customer_actions.dart';
import '../subscription/subscription_actions.dart';
import '../pickup/pickup_actions.dart';
import 'app_state.dart';
import '../../data/models/customer.dart';
import '../../data/models/pickup.dart';
import '../../data/models/subscription.dart';
import '../../data/repository.dart';


class AppMiddleware {
  final Repository repository;

  const AppMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createAppMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, dynamic>(_logAction),
      TypedMiddleware<AppState, LoadCustomerAction>(_loadCustomer),
      TypedMiddleware<AppState, LoadSubscriptionAction>(_loadSubscription),
      TypedMiddleware<AppState, LoadPickupsAction>(_loadPickups),
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
      final Subscription subscription = Subscription.fromJson(subscriptionData);
      store.dispatch(LoadSubscriptionSuccess(subscription: subscription));
      store.dispatch(LoadPickupsAction(subscription: subscription));
    } catch (e) {
      store.dispatch(LoadSubscriptionFailure(error: e.toString()));
    }
  }

  void _loadPickups(Store<AppState> store, LoadPickupsAction action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> pickupsData = await repository.fetchPickups(action.subscription.id);
      store.dispatch(LoadPickupsSuccess(pickups: List<Pickup>.from(pickupsData.map<dynamic>((dynamic x) => Pickup.fromJson(x)))));
    } catch (e) {
      store.dispatch(LoadPickupsFailure(error: e.toString()));
    }
  }
}