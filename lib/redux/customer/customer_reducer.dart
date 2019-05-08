import 'package:redux/redux.dart';

import 'customer_actions.dart';
import 'customer_state.dart';
import '../../data/models/phone_number.dart';
import '../../data/models/email.dart';



Reducer<CustomerState> customerReducer = combineReducers([
  TypedReducer<CustomerState, LoadCustomerRequest>(_loadCustomerRequest),
  TypedReducer<CustomerState, LoadCustomerSuccess>(_loadCustomerSuccess),
  TypedReducer<CustomerState, LoadCustomerFailure>(_loadCustomerFailure),
  TypedReducer<CustomerState, LoadPhoneNumbersRequest>(_loadPhoneNumbersRequest),
  TypedReducer<CustomerState, LoadPhoneNumbersSuccess>(_loadPhoneNumbersSuccess),
  TypedReducer<CustomerState, LoadPhoneNumbersFailure>(_loadPhoneNumbersFailure),
  TypedReducer<CustomerState, LoadEmailsRequest>(_loadEmailsRequest),
  TypedReducer<CustomerState, LoadEmailsSuccess>(_loadEmailsSuccess),
  TypedReducer<CustomerState, LoadEmailsFailure>(_loadEmailsFailure),
]);

// CUSTOMER
CustomerState _loadCustomerRequest(CustomerState state, LoadCustomerRequest action) {
  return state.rebuild((CustomerStateBuilder b) => b
    ..fetchCount = state.fetchCount + 1
  );
}

CustomerState _loadCustomerSuccess(CustomerState state, LoadCustomerSuccess action) {
  return state.rebuild((CustomerStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..customer.replace(action.customer)
  );
}

CustomerState _loadCustomerFailure(CustomerState state, LoadCustomerFailure action) {
  return state.rebuild((CustomerStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..error = action.error
  );
}


// PHONE NUMBERS
CustomerState _loadPhoneNumbersRequest(CustomerState state, LoadPhoneNumbersRequest action) {
  return state.rebuild((CustomerStateBuilder b) => b
    ..fetchCount = state.fetchCount + 1
  );
}

CustomerState _loadPhoneNumbersSuccess(CustomerState state, LoadPhoneNumbersSuccess action) {
  return state.rebuild((CustomerStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..phoneNumbers.replace(Map<int, PhoneNumber>.fromIterable(
      action.phoneNumbers,
      key: (dynamic phoneNumber) => phoneNumber.id,
      value: (dynamic phoneNumber) => phoneNumber
    ))
  );
}

CustomerState _loadPhoneNumbersFailure(CustomerState state, LoadPhoneNumbersFailure action) {
  return state.rebuild((CustomerStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..error = action.error
  );
}


// EMAILS
CustomerState _loadEmailsRequest(CustomerState state, LoadEmailsRequest action) {
  return state.rebuild((CustomerStateBuilder b) => b
    ..fetchCount = state.fetchCount + 1
  );
}

CustomerState _loadEmailsSuccess(CustomerState state, LoadEmailsSuccess action) {
  return state.rebuild((CustomerStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..emails.replace(Map<int, Email>.fromIterable(
      action.emails,
      key: (dynamic email) => email.id,
      value: (dynamic email) => email
    ))
  );
}

CustomerState _loadEmailsFailure(CustomerState state, LoadEmailsFailure action) {
  return state.rebuild((CustomerStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..error = action.error
  );
}