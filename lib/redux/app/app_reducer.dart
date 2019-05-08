import 'app_state.dart';
import '../auth/auth_reducer.dart';
import '../customer/customer_reducer.dart';
import '../nav/nav_reducer.dart';
import '../subscription/subscription_reducer.dart';
import '../subscription/form/subscription_form_reducer.dart';
import '../pickup/pickup_reducer.dart';
import '../auth/auth_actions.dart';
import '../data/data_reducer.dart';
import '../invoice/invoice_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is UserLogout) {
    return AppState();
  }

  return state.rebuild((AppStateBuilder b) => b
    ..authState.replace(authReducer(state.authState, action))
    ..navState.replace(navReducer(state.navState, action))
    ..customerState.replace(customerReducer(state.customerState, action))
    ..subscriptionState.replace(subscriptionReducer(state.subscriptionState, action))
    ..subscriptionFormState.replace(subscriptionFormReducer(state.subscriptionFormState, action))
    ..pickupState.replace(pickupReducer(state.pickupState, action))
    ..dataState.replace(dataReducer(state.dataState, action))
    ..invoiceState.replace(invoiceReducer(state.invoiceState, action))
  );
}