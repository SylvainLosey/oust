import 'package:redux/redux.dart';

import '../app/app_state.dart';
import '../customer/customer_actions.dart';
import '../subscription/subscription_actions.dart';
import '../../data/models/customer.dart';
import '../../data/models/serializers.dart';
import '../../data/repository.dart';

class CustomerMiddleware {
  final Repository repository;
  const CustomerMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createCustomerMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, LoadCustomerRequest>(_loadCustomer),
      TypedMiddleware<AppState, CreateCustomerRequest>(_createCustomerRequest),
    ];
  }

  void _loadCustomer(Store<AppState> store, LoadCustomerRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> customerData = await repository.fetchCustomer(action.user.id);
      final Customer customer = serializers.deserializeWith(Customer.serializer, customerData[0]);

      store.dispatch(LoadCustomerSuccess(customer: customer));
      store.dispatch(LoadSubscriptionRequest(customer: customer));
      store.dispatch(LoadConsumerSubscriptionRequest(customer: customer));

    } catch (e) {
      store.dispatch(LoadCustomerFailure(error: e.toString()));
    }
  }

  void _createCustomerRequest(Store<AppState> store, CreateCustomerRequest action, NextDispatcher next) async {
    next(action);

    try {
      final Customer customer = Customer((CustomerBuilder b) => b
        ..firstName = action.firstName
        ..lastName = action.lastName
        ..address = action.address
        ..postcode = action.postcode
        ..preferedCommunication = action.preferedCommunication
        ..preferedPaymentMethod = 'I'
        ..user = action.userId
      );

      final Map<String, dynamic> data = await repository.createCustomer(customer);
      action.completer.complete(data['id']);
      store.dispatch(CreateCustomerSuccess());
    } catch (e) {
      store.dispatch(CreateCustomerFailure(error: e.toString()));
    }
  }
}