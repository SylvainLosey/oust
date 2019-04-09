import 'package:redux/redux.dart';

import 'customer_actions.dart';
import 'customer_state.dart';



Reducer<CustomerState> customerReducer = combineReducers([
  TypedReducer<CustomerState, LoadCustomerRequest>(_loadCustomerRequest),
  TypedReducer<CustomerState, LoadCustomerSuccess>(_loadCustomerSuccess),
  TypedReducer<CustomerState, LoadCustomerFailure>(_loadCustomerFailure),
]);

CustomerState _loadCustomerRequest(CustomerState state, LoadCustomerRequest action) {
  return state.rebuild((b) => b
    .. isLoading = true
  );
}

CustomerState _loadCustomerSuccess(CustomerState state, LoadCustomerSuccess action) {
  return state.rebuild((b) => b
    ..isLoading = false
    ..customer.replace(action.customer)
  );
}

CustomerState _loadCustomerFailure(CustomerState state, LoadCustomerFailure action) {
  return state.rebuild((b) => b
    ..isLoading = false
    ..error = action.error
  );
}