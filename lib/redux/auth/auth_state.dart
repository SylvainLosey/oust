library auth_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/user.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  bool get isLoading;
  bool get isAuthenticated;
  @nullable
  User get user;
  @nullable
  String get error;

  AuthState._();

  factory AuthState([updates(AuthStateBuilder b)]) => _$AuthState((b) => b
      ..isLoading = false
      ..isAuthenticated = false);

  // String toJson() {
  //   return json.encode(serializers.serializeWith(AuthState.serializer, this));
  // }

  // static AuthState fromJson(String jsonString) {
  //   return serializers.deserializeWith(AuthState.serializer, json.decode(jsonString));
  // }

  static Serializer<AuthState> get serializer => _$authStateSerializer;
}

