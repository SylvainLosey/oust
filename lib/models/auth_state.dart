import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

import 'user.dart';

part 'auth_state.g.dart';

@JsonSerializable()
@immutable
class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final User user;
  final String error;

  AuthState({
    this.isLoading,
    this.isAuthenticated ,
    this.user,
    this.error,
  });

  factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);
  Map<String, dynamic> toJson() => _$AuthStateToJson(this);

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      isAuthenticated: false,
    );
  }

  AuthState copyWith({
    bool isLoading,
    bool isAuthenticated,
    User user,
    String error
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}