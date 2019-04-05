import 'app_state.dart';
import '../auth/auth_reducer.dart';
import '../customer/customer_reducer.dart';
import '../nav/nav_reducer.dart';
import '../subscription/subscription_reducer.dart';
import '../subscription/form/subscription_form_reducer.dart';
import '../pickup/pickup_reducer.dart';
import '../auth/auth_actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is UserLogout) {
    return AppState.initial();
  }

  return AppState(
    authState: authReducer(state.authState, action),
    customerState: customerReducer(state.customerState, action),
    subscriptionState: subscriptionReducer(state.subscriptionState, action),
    subscriptionFormState: subscriptionFormReducer(state.subscriptionFormState, action),
    pickupState: pickupReducer(state.pickupState, action),
    navState: navReducer(state.navState, action),
  );
}