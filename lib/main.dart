import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

import 'app.dart';
import 'redux/app/app_middleware.dart';
import 'redux/app/app_reducer.dart';
import 'redux/app/app_state.dart';
import 'redux/auth/auth_actions.dart';
import 'redux/auth/auth_middleware.dart';
import 'redux/nav/nav_middleware.dart';
import 'redux/customer/customer_middleware.dart';
import 'redux/subscription/subscription_middleware.dart';
import 'redux/subscription/form/subscription_form_middleware.dart';
import 'redux/pickup/pickup_middleware.dart';
import 'redux/data/data_middleware.dart';
import 'redux/invoice/invoice_middleware.dart';
import 'redux/lift/lift_middleware.dart';
import 'redux/lift/forms/quote/lift_quote_form_middleware.dart';
import 'data/repository.dart';

void main() async {
  // debugPaintSizeEnabled=true;

  final RemoteDevToolsMiddleware remoteDevtools = RemoteDevToolsMiddleware('192.168.1.106:8000');
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const Repository repository = Repository();

  final Store<AppState> store = Store<AppState>(appReducer, initialState: AppState(), middleware: [
    ...NavMiddleware(navigatorKey).createNavMiddleware(),
    ...AuthMiddleware(repository).createAuthMiddleware(),
    ...AppMiddleware(repository).createAppMiddleware(),
    ...CustomerMiddleware(repository).createCustomerMiddleware(),
    ...SubscriptionMiddleware(repository).createSubscriptionMiddleware(),
    ...SubscriptionFormMiddleware(repository).createSubscriptionFormMiddleware(),
    ...PickupMiddleware(repository).createPickupMiddleware(),
    ...DataMiddleware(repository).createDataMiddleware(),
    ...InvoiceMiddleware(repository).createInvoiceMiddleware(),
    ...LiftMiddleware(repository).createLiftMiddleware(),
    ...LiftQuoteFormMiddleware(repository).createLiftQuoteFormMiddleware(),
    remoteDevtools
  ]);

  remoteDevtools.store = store;
  await remoteDevtools.connect();

  runApp(App(store, navigatorKey));
  store.dispatch(AppStarted());
}
