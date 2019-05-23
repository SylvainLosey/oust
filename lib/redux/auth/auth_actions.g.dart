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
  return UserLoginSuccess(key: json['key'] as String, id: json['id'] as int);
}

Map<String, dynamic> _$UserLoginSuccessToJson(UserLoginSuccess instance) =>
    <String, dynamic>{'key': instance.key, 'id': instance.id};

UserLoaded _$UserLoadedFromJson(Map<String, dynamic> json) {
  return UserLoaded(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      shoudlLoadCustomer: json['shoudlLoadCustomer'] as bool);
}

Map<String, dynamic> _$UserLoadedToJson(UserLoaded instance) =>
    <String, dynamic>{
      'user': instance.user,
      'shoudlLoadCustomer': instance.shoudlLoadCustomer
    };

UserLoginFailure _$UserLoginFailureFromJson(Map<String, dynamic> json) {
  return UserLoginFailure(error: json['error'] as String);
}

Map<String, dynamic> _$UserLoginFailureToJson(UserLoginFailure instance) =>
    <String, dynamic>{'error': instance.error};

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) {
  return CreateUserRequest(
      email: json['email'] as String, password: json['password'] as String);
}

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

CreateUserSuccess _$CreateUserSuccessFromJson(Map<String, dynamic> json) {
  return CreateUserSuccess();
}

Map<String, dynamic> _$CreateUserSuccessToJson(CreateUserSuccess instance) =>
    <String, dynamic>{};

CreateUserFailure _$CreateUserFailureFromJson(Map<String, dynamic> json) {
  return CreateUserFailure(error: json['error'] as String);
}

Map<String, dynamic> _$CreateUserFailureToJson(CreateUserFailure instance) =>
    <String, dynamic>{'error': instance.error};

StoreFCMToken _$StoreFCMTokenFromJson(Map<String, dynamic> json) {
  return StoreFCMToken(
      registrationId: json['registrationId'] as String,
      type: json['type'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$StoreFCMTokenToJson(StoreFCMToken instance) =>
    <String, dynamic>{
      'user': instance.user,
      'registrationId': instance.registrationId,
      'type': instance.type
    };

DeleteFCMToken _$DeleteFCMTokenFromJson(Map<String, dynamic> json) {
  return DeleteFCMToken(registrationId: json['registrationId'] as String);
}

Map<String, dynamic> _$DeleteFCMTokenToJson(DeleteFCMToken instance) =>
    <String, dynamic>{'registrationId': instance.registrationId};
