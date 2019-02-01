import 'package:redux/redux.dart';

import '../actions/customer_actions.dart';
import '../models/app_state.dart';
import '../models/customer_model.dart';

import '../services/repository.dart';

class AppMiddleware {
  final Repository repository;

  const AppMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createAppMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, dynamic>(_logAction),
      TypedMiddleware<AppState, LoadCustomerAction>(_loadCustomer),
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
      store.dispatch(LoadCustomerSuccess(customer: Customer.fromJson(customerData)));
    } catch (e) {
      store.dispatch(LoadCustomerFailure(error: e.toString()));
    }
  }
}