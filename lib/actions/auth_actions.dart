import '../models/user.dart';

class AppStarted {}

class UserLoginRequest {
  final String email;
  final String password;

  UserLoginRequest({this.email, this.password});
}

class UserLoginSuccess {
  final String token;
  final int id;
  final String email;

  UserLoginSuccess({this.token, this.id, this.email});
}

class UserLoaded {
  final User user;

  UserLoaded({this.user});
}

class UserLoginFailure {
  final String error;

  UserLoginFailure({this.error});
}

class UserLogout {}