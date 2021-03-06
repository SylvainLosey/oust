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
import '../../../utils/datetime.dart';

class SubscriptionFormMiddleware {
  final Repository repository;
  const SubscriptionFormMiddleware(this.repository);

  List<Middleware<AppState>> createSubscriptionFormMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, PostSubscriptionLeadRequest>(_postLead),
      TypedMiddleware<AppState, LoadStartDatesRequest>(_loadStartDates),
      TypedMiddleware<AppState, SubmitSubscriptionFormRequest>(_submitForm),
    ];
  }

  void _postLead(Store<AppState> store, PostSubscriptionLeadRequest action, NextDispatcher next) async {
    next(action);

    String _getService(int frequency) {
      switch (frequency) {
        case 1:
          return 'subscription_premium';
        case 2:
          return 'subscription_standard';
        case 4:
          return 'subscription_basic';
        default:
          return '';
      }
    }

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
        service: _getService(action.subscriptionForm.frequency),
      );

      // Navifate to succes page then delete form data
      store.dispatch(SubscriptionFormNextStep());
      store.dispatch(PostSubscriptionLeadSuccess());
    } catch (e) {
      store.dispatch(PostSubscriptionLeadFailure(error: e.toString()));
    }
  }

  void _loadStartDates(Store<AppState> store, LoadStartDatesRequest action, NextDispatcher next) async {
    next(action);

    try {
      final dynamic data = await repository.fetchStartDates(
          address: action.address, postcode: action.postcode, frequency: action.frequency);

      // Ok so the thing is, built_value wants dates to be stored in UTC. The API returns dates in format '2019-01-31'.
      // Dart does not support Dates only DateTime. So if we just parse the result its gonna create a date in the local Time zone.
      // Casting it to UTC will then CHANGE THE DATE in some cases which is not what we want. It is not possible to override parse to UTC.
      // Solution is parsing to local time, then using custom a method to construct a UTC DateTime with only year, month and day.
      final List<DateTime> startDates =
          List<DateTime>.from(data['dates'].map<dynamic>((dynamic x) => dateTimeToDate(DateTime.parse(x), utc: true)));
      store.dispatch(LoadStartDatesSuccess(startDates: startDates));
    } catch (e) {
      store.dispatch(LoadStartDatesFailure(error: e.toString()));
    }
  }

  void _submitForm(Store<AppState> store, SubmitSubscriptionFormRequest action, NextDispatcher next) async {
    next(action);

    final SubscriptionForm form = store.state.subscriptionFormState.subscriptionForm;

    final Completer _createUserCompleter = Completer();

    store.dispatch(CreateUserRequest(email: form.email, password: form.password, completer: _createUserCompleter));

    _createUserCompleter.future.then((userId) {
      final Completer _createCustomerCompleter = Completer();

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
        final Completer _createSubscriptionCompleter = Completer();

        store.dispatch(CreateSubscriptionRequest(
            baseDate: form.selectedStartDate,
            note: form.location,
            customerId: customerId,
            completer: _createSubscriptionCompleter));

        store.dispatch(CreatePhoneNumberRequest(
            phoneNumber: form.phoneNumber,
            reminder: form.wantsReminder,
            // TODO Determine or ask number type
            numberType: 'M',
            customerId: customerId));

        store.dispatch(CreateEmailRequest(email: form.email, usedForInvoices: true, customerId: customerId));

        final Completer _smallContainerCompleter = Completer();
        if (form.smallContainerQuantity > 0) {
          store.dispatch(CreateInvoiceItemRequest(
              productId: 6,
              amount: form.smallContainerQuantity,
              customerId: customerId,
              completer: _smallContainerCompleter));
        } else {
          _smallContainerCompleter.complete();
        }

        final Completer _bigContainerCompleter = Completer();
        if (form.bigContainerQuantity > 0) {
          store.dispatch(CreateInvoiceItemRequest(
              productId: 7,
              amount: form.bigContainerQuantity,
              customerId: customerId,
              completer: _bigContainerCompleter));
        } else {
          _bigContainerCompleter.complete();
        }

        // We wait on subscription and all bins to be created before creating Consumber Subscription and therefore the invoice
        Future.wait(
                [_createSubscriptionCompleter.future, _smallContainerCompleter.future, _bigContainerCompleter.future])
            .then((returnValue) {
          final Completer _createConsumerSubscriptionCompleter = Completer();

          store.dispatch(CreateConsumerSubscriptionRequest(
              packageId: form.selectedPackage,
              subscriptionId: returnValue[0],
              completer: _createConsumerSubscriptionCompleter));
          _createConsumerSubscriptionCompleter.future.then((_) {
            store.dispatch(AppStarted());
            store.dispatch(SubmitSubscriptionFormSuccess());
          }).catchError((dynamic e) => store.dispatch(SubmitSubscriptionFormFailure(error: e.toString())));
        }).catchError((dynamic e) => store.dispatch(SubmitSubscriptionFormFailure(error: e.toString())));
      }).catchError((dynamic e) => store.dispatch(SubmitSubscriptionFormFailure(error: e.toString())));
    }).catchError((dynamic e) => store.dispatch(SubmitSubscriptionFormFailure(error: e.toString())));
  }
}
