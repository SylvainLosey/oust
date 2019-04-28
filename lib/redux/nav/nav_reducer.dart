import 'package:redux/redux.dart';

import 'nav_actions.dart';
import 'nav_state.dart';


Reducer<NavState> navReducer = combineReducers([
  TypedReducer<NavState, ChangeBottomNavAction>(_changeBottomNav),
]);

NavState _changeBottomNav(NavState state, ChangeBottomNavAction action) {
  return state.rebuild((NavStateBuilder b) => b
    ..selectedBottomNav = action.index,
  );
}