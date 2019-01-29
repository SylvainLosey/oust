import 'package:flutter/material.dart';

import '../screens/lifts_screen.dart';

@immutable
class NavState {
  final int selectedBottomNav;
  final Widget rootScreen;

  NavState({
    @required this.selectedBottomNav,
    @required this.rootScreen,
  });

  factory NavState.initial() {
    return NavState(
      selectedBottomNav: 0,
      rootScreen: LiftsScreen(),
    );
  }

  NavState copyWith({
    int selectedBottomNav,
    Widget rootScreen,
  }) {
    return NavState(
      selectedBottomNav: selectedBottomNav ?? this.selectedBottomNav,
      rootScreen: rootScreen ?? this.rootScreen,
    );
  }

  //TODO hash code and equals
}