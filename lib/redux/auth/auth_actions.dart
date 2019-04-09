import 'package:json_annotation/json_annotation.dart';

import '../../data/models/user.dart';

// part 'auth_actions.g.dart';

class AppStarted {}

@JsonSerializable()
class UserLoginRequest {
  final String email;
  final String password;

  UserLoginRequest({this.email, this.password});

  // factory UserLoginRequest.fromJson(Map<String, dynamic> json) => _$UserLoginRequestFromJson(json);
  // Map<String, dynamic> toJson() => _$UserLoginRequestToJson(this);
}
@JsonSerializable()

class UserLoginSuccess {
  final String key;
  final int id;

  UserLoginSuccess({this.key, this.id});

  // factory UserLoginSuccess.fromJson(Map<String, dynamic> json) => _$UserLoginSuccessFromJson(json);
  // Map<String, dynamic> toJson() => _$UserLoginSuccessToJson(this);
}

// @JsonSerializable()
class UserLoaded {
  final User user;

  UserLoaded({this.user});

  // factory UserLoaded.fromJson(Map<String, dynamic> json) => _$UserLoadedFromJson(json);
  // Map<String, dynamic> toJson() => _$UserLoadedToJson(this);
}

@JsonSerializable()
class UserLoginFailure {
  final String error;

  UserLoginFailure({this.error});

  // factory UserLoginFailure.fromJson(Map<String, dynamic> json) => _$UserLoginFailureFromJson(json);
  // Map<String, dynamic> toJson() => _$UserLoginFailureToJson(this);
}

class UserLogout {}