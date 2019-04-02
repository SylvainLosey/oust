import 'app_state.dart';
import '../auth/auth_reducer.dart';
import '../customer/customer_reducer.dart';
import '../nav/nav_reducer.dart';
import '../subscription/subscription_reducer.dart';
import '../pickup/pickup_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    authState: authReducer(state.authState, action),
    customerState: customerReducer(state.customerState, action),
    subscriptionState: subscriptionReducer(state.subscriptionState, action),
    pickupState: pickupReducer(state.pickupState, action),
    navState: navReducer(state.navState, action),
  );
}