// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  return AuthState(
      isLoading: json['isLoading'] as bool,
      isAuthenticated: json['isAuthenticated'] as bool,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      error: json['error'] as String);
}

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
      'isLoading': instance.isLoading,
      'isAuthenticated': instance.isAuthenticated,
      'user': instance.user,
      'error': instance.error
    };
