import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'nav_actions.dart';
import 'nav_state.dart';
import '../../ui/lift/lifts_screen.dart';
import '../../ui/account/profile_screen.dart';
import '../../ui/subscription/subscription_screen.dart';


Reducer<NavState> navReducer = combineReducers([
  TypedReducer<NavState, ChangeBottomNavAction>(_changeBottomNav),
]);

NavState _changeBottomNav(NavState state, ChangeBottomNavAction action) {
  return state.rebuild((b) => b
    ..selectedBottomNav = action.index,
  );
}