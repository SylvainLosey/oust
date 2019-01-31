import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/nav_state.dart';
import '../screens/lifts_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/subscription_screen.dart';


Reducer<NavState> navReducer = combineReducers([
  TypedReducer<NavState, ChangeBottomNavAction>(_changeBottomNav),
]);

NavState _changeBottomNav(NavState state, ChangeBottomNavAction action) {
  Widget rootScreen = state.rootScreen;

  if (action.index == 0) {
    rootScreen = LiftsScreen();
  } else if (action.index == 1) {
    rootScreen = SubscriptionScreen();
  } else if (action.index == 2) {
    rootScreen = ProfileScreen();
  }

  return state.copyWith(
    selectedBottomNav: action.index,
    rootScreen: rootScreen,
  );
}