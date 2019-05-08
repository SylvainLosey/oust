import 'dart:async';

import 'package:redux/redux.dart';

import 'subscription_form_actions.dart';
import '../../auth/auth_actions.dart';
import '../../app/app_state.dart';
import '../../customer/customer_actions.dart';
import '../../subscription/subscription_actions.dart';
import '../../invoice/invoice_actions.dart';
import '../../../data/models/subscription_form.dart';
import '../../../data/repository.dart';

class SubscriptionFormMiddleware {
  final Repository repository;
  const SubscriptionFormMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createSubscriptionFormMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, PostLeadRequest>(_postLead),
      TypedMiddleware<AppState, LoadStartDatesRequest>(_loadStartDates),
      TypedMiddleware<AppState, SubmitSubscriptionFormRequest>(_submitForm),
    ];
  }

  void _postLead(Store<AppState> store, PostLeadRequest action, NextDispatcher next) async {
    next(action);

    try {
      await repository.postLead(
        firstName: action.subscriptionForm.firstName,
        lastName: action.subscriptionForm.lastName,
        address: action.subscriptionForm.address,
        postcode: action.subscriptionForm.postcode,
        email: action.subscriptionForm.email,
        phoneNumber: action.subscriptionForm.phoneNumber,
        contactMethod: action.subscriptionForm.contactMethod,
        status: action.subscriptionForm.leadStatus,
      );

      // Navifate to succes page then delete form data
      store.dispatch(SubscriptionFormNextStep());
      store.dispatch(PostLeadSuccess());
    } catch (e) {
      store.dispatch(PostLeadFailure(error: e.toString()));
    }
  }

  void _loadStartDates(Store<AppState> store, LoadStartDatesRequest action, NextDispatcher next) async {
    next(action);

    try {
      final dynamic data = await repository.fetchStartDates(
        address: action.address,
        postcode: action.postcode,
        frequency: action.frequency
      );
      final List<DateTime> startDates = List<DateTime>.from(data['dates'].map<dynamic>((dynamic x) => DateTime.parse(x)));
      store.dispatch(LoadStartDatesSuccess(startDates: startDates));
    } catch (e) {
      store.dispatch(LoadStartDatesFailure(error: e.toString()));
    }
  }

  void _submitForm(Store<AppState> store, SubmitSubscriptionFormRequest action, NextDispatcher next) async {
    next(action);

    final SubscriptionForm form = store.state.subscriptionFormState.subscriptionForm;

    Completer _createUserCompleter = Completer();
    
    store.dispatch(CreateUserRequest(
      email: form.email,
      password: form.password,
      completer: _createUserCompleter
    ));
    _createUserCompleter.future.then((userId) {
      Completer _createCustomerCompleter = Completer();

      store.dispatch(CreateCustomerRequest(
        firstName: form.firstName,
        lastName: form.lastName,
        address: form.address,
        postcode: form.postcode,
        preferedCommunication: form.paymentMethod == 'emailInvoice' ? 'E' : 'C',
        userId: userId,
        completer: _createCustomerCompleter,
      ));
      _createCustomerCompleter.future.then((customerId) {
        Completer _createSubscriptionCompleter = Completer();

        store.dispatch(CreateSubscriptionRequest(
          baseDate: form.selectedStartDate,
          note: form.location,
          customerId: customerId,
          completer: _createSubscriptionCompleter
        ));

        store.dispatch(CreatePhoneNumberRequest(
          phoneNumber: form.phoneNumber,
          reminder: form.wantsReminder,
          // TODO Determine or ask number type
          numberType: 'M',
          customerId: customerId
        ));

        store.dispatch(CreateEmailRequest(
          email: form.email,
          usedForInvoices: true,
          customerId: customerId
        ));

        Completer _smallContainerCompleter = Completer();
        if (form.smallContainerQuantity > 0) {
          store.dispatch(CreateInvoiceItemRequest(
            productId: 6,
            amount: form.smallContainerQuantity,
            customerId: customerId,
            completer: _smallContainerCompleter
          ));
        } else {
          _smallContainerCompleter.complete();
        }

        Completer _bigContainerCompleter = Completer();
        if (form.bigContainerQuantity > 0) {
          store.dispatch(CreateInvoiceItemRequest(
            productId: 7,
            amount: form.bigContainerQuantity,
            customerId: customerId,
            completer: _bigContainerCompleter
          ));
        } else {
          _bigContainerCompleter.complete();
        }

        // We wait on subscription and all bins to be created before creating Consumber Subscription and therefore the invoice
        Future.wait([
          _createSubscriptionCompleter.future,
          _smallContainerCompleter.future,
          _bigContainerCompleter.future
        ]).then((returnValue) {
          Completer _createConsumerSubscriptionCompleter = Completer();

          store.dispatch(CreateConsumerSubscriptionRequest(
            packageId: form.selectedPackage,
            subscriptionId: returnValue[0],
            completer: _createConsumerSubscriptionCompleter
          ));
        });
      });
    });
  }
}