import '../models/app_state.dart';
import '../reducers/auth_reducer.dart';
import '../reducers/customer_reducer.dart';
import '../reducers/nav_reducer.dart';
import '../reducers/subscription_recducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    authState: authReducer(state.authState, action),
    customerState: customerReducer(state.customerState, action),
    subscriptionState: subscriptionReducer(state.subscriptionState, action),
    navState: navReducer(state.navState, action),
  );
}