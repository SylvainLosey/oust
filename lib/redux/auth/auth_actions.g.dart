// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginRequest _$UserLoginRequestFromJson(Map<String, dynamic> json) {
  return UserLoginRequest(
      email: json['email'] as String, password: json['password'] as String);
}

Map<String, dynamic> _$UserLoginRequestToJson(UserLoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

UserLoginSuccess _$UserLoginSuccessFromJson(Map<String, dynamic> json) {
  return UserLoginSuccess(
      token: json['token'] as String,
      id: json['id'] as int,
      email: json['email'] as String);
}

Map<String, dynamic> _$UserLoginSuccessToJson(UserLoginSuccess instance) =>
    <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'email': instance.email
    };

UserLoaded _$UserLoadedFromJson(Map<String, dynamic> json) {
  return UserLoaded(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UserLoadedToJson(UserLoaded instance) =>
    <String, dynamic>{'user': instance.user};

UserLoginFailure _$UserLoginFailureFromJson(Map<String, dynamic> json) {
  return UserLoginFailure(error: json['error'] as String);
}

Map<String, dynamic> _$UserLoginFailureToJson(UserLoginFailure instance) =>
    <String, dynamic>{'error': instance.error};
