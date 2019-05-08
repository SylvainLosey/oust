import 'package:redux/redux.dart';

import '../app/app_state.dart';
import '../customer/customer_actions.dart';
import '../subscription/subscription_actions.dart';
import '../../data/models/customer.dart';
import '../../data/models/phone_number.dart';
import '../../data/models/email.dart';
import '../../data/models/serializers.dart';
import '../../data/repository.dart';

class CustomerMiddleware {
  final Repository repository;
  const CustomerMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createCustomerMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, LoadCustomerRequest>(_loadCustomer),
      TypedMiddleware<AppState, CreateCustomerRequest>(_createCustomerRequest),
      TypedMiddleware<AppState, LoadPhoneNumbersRequest>(_loadPhoneNumbersRequest),
      TypedMiddleware<AppState, CreatePhoneNumberRequest>(_createPhoneNumberRequest),
      TypedMiddleware<AppState, LoadEmailsRequest>(_loadEmailsRequest),
      TypedMiddleware<AppState, CreateEmailRequest>(_createEmailRequest),
    ];
  }

  // CUSTOMER
  void _loadCustomer(Store<AppState> store, LoadCustomerRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> customerData = await repository.fetchCustomer(action.user.id);
      final Customer customer = serializers.deserializeWith(Customer.serializer, customerData[0]);

      store.dispatch(LoadCustomerSuccess(customer: customer));

      store.dispatch(LoadPhoneNumbersRequest(customer: customer));
      store.dispatch(LoadEmailsRequest(customer: customer));
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


  // PHONENUMBERS
  void _loadPhoneNumbersRequest(Store<AppState> store, LoadPhoneNumbersRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> data = await repository.fetchPhoneNumbers(action.customer.id);
      final List<PhoneNumber> phoneNumbers = List<PhoneNumber>.from(data.map<dynamic>((dynamic x) => PhoneNumber.fromJson(x)));
      store.dispatch(LoadPhoneNumbersSuccess(phoneNumbers: phoneNumbers));
    } catch (e) {
      store.dispatch(LoadPhoneNumbersFailure(error: e.toString()));
    }
  }

  void _createPhoneNumberRequest(Store<AppState> store, CreatePhoneNumberRequest action, NextDispatcher next) async {
    next(action);

    try {
      final PhoneNumber phoneNumber = PhoneNumber((PhoneNumberBuilder b) => b
        ..phoneNumber = action.phoneNumber
        ..numberType = action.numberType
        ..reminder = action.reminder
        ..customer = action.customerId
      );

      await repository.createPhoneNumber(phoneNumber);
      store.dispatch(CreatePhoneNumberSuccess());
    } catch (e) {
      store.dispatch(CreatePhoneNumberFailure(error: e.toString()));
    }
  }

  // EMAILS
  void _loadEmailsRequest(Store<AppState> store, LoadEmailsRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> data = await repository.fetchEmails(action.customer.id);
      final List<Email> emails = List<Email>.from(data.map<dynamic>((dynamic x) => Email.fromJson(x)));
      store.dispatch(LoadEmailsSuccess(emails: emails));
    } catch (e) {
      store.dispatch(LoadEmailsFailure(error: e.toString()));
    }
  }

  void _createEmailRequest(Store<AppState> store, CreateEmailRequest action, NextDispatcher next) async {
    next(action);

    try {
      final Email email = Email((EmailBuilder b) => b
        ..email = action.email
        ..usedForInvoices = action.usedForInvoices
        ..customer = action.customerId
      );

      await repository.createEmail(email);
      store.dispatch(CreateEmailSuccess());
    } catch (e) {
      store.dispatch(CreateEmailFailure(error: e.toString()));
    }
  }
}