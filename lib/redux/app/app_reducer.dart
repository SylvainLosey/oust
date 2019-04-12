import 'app_state.dart';
import '../auth/auth_reducer.dart';
import '../customer/customer_reducer.dart';
import '../nav/nav_reducer.dart';
import '../subscription/subscription_reducer.dart';
import '../subscription/register/subscription_register_reducer.dart';
import '../pickup/pickup_reducer.dart';
import '../auth/auth_actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is UserLogout) {
    return AppState();
  }

  return state.rebuild((b) => b
    ..authState.replace(authReducer(state.authState, action))
    ..navState.replace(navReducer(state.navState, action))
    ..customerState.replace(customerReducer(state.customerState, action))
    ..subscriptionState.replace(subscriptionReducer(state.subscriptionState, action))
    ..subscriptionRegisterState.replace(subscriptionRegisterReducer(state.subscriptionRegisterState, action))
    ..pickupState.replace(pickupReducer(state.pickupState, action))
  );
}