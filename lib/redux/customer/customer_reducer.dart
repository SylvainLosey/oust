import 'package:redux/redux.dart';

import 'customer_actions.dart';
import 'customer_state.dart';



Reducer<CustomerState> customerReducer = combineReducers([
  TypedReducer<CustomerState, LoadCustomerAction>(_loadUserAction),
  TypedReducer<CustomerState, LoadCustomerSuccess>(_loadCustomerSuccess),
  TypedReducer<CustomerState, LoadCustomerFailure>(_loadCustomerFailure),
]);

CustomerState _loadUserAction(CustomerState state, LoadCustomerAction action) {
  return state.copyWith(
    isLoading: true,
  );
}

CustomerState _loadCustomerSuccess(CustomerState state, LoadCustomerSuccess action) {
  return state.copyWith(
    isLoading: false,
    customer: action.customer,
  );
}

CustomerState _loadCustomerFailure(CustomerState state, LoadCustomerFailure action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
  );
}