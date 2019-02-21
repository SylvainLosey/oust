import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

import '../screens/lifts_screen.dart';

part 'nav_state.g.dart';

@JsonSerializable()
@immutable
class NavState {
  final int selectedBottomNav;

  @JsonKey(ignore: true)
  final Widget rootScreen;

  NavState({
    @required this.selectedBottomNav,
    @required this.rootScreen,
  });

  factory NavState.fromJson(Map<String, dynamic> json) => _$NavStateFromJson(json);
  Map<String, dynamic> toJson() => _$NavStateToJson(this);


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