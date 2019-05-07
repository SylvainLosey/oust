import 'dart:async';

import 'package:json_annotation/json_annotation.dart';

import '../../data/models/user.dart';

part 'auth_actions.g.dart';

class AppStarted {}

@JsonSerializable()
class UserLoginRequest {
  final String email;
  final String password;

  UserLoginRequest({this.email, this.password});
  Map<String, dynamic> toJson() => _$UserLoginRequestToJson(this);
}

@JsonSerializable()
class UserLoginSuccess {
  final String key;
  final int id;

  UserLoginSuccess({this.key, this.id});
  Map<String, dynamic> toJson() => _$UserLoginSuccessToJson(this);
}

@JsonSerializable()
class UserLoaded {
  @JsonKey(fromJson: User.fromJson) 
  final User user;
  final bool shoudlLoadCustomer;

  UserLoaded({this.user, this.shoudlLoadCustomer});
  Map<String, dynamic> toJson() => _$UserLoadedToJson(this);
}

@JsonSerializable()
class UserLoginFailure {
  final String error;

  UserLoginFailure({this.error});
  Map<String, dynamic> toJson() => _$UserLoginFailureToJson(this);
}

class UserLogout {}

@JsonSerializable()
class CreateUserRequest {
  final String email;
  final String password;
  @JsonKey(ignore: true)
  final Completer completer;

  CreateUserRequest({this.email, this.password, this.completer});
  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}

@JsonSerializable()
class CreateUserSuccess {
  Map<String, dynamic> toJson() => _$CreateUserSuccessToJson(this); 
}

@JsonSerializable()
class CreateUserFailure {
  final String error;
  
  CreateUserFailure({this.error});
  Map<String, dynamic> toJson() => _$CreateUserFailureToJson(this); 
}