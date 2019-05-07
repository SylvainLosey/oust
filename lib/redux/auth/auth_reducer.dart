import 'package:redux/redux.dart';

import 'auth_actions.dart';
import 'auth_state.dart';


Reducer<AuthState> authReducer = combineReducers([
  TypedReducer<AuthState, UserLoginRequest>(_userLoginRequest),
  TypedReducer<AuthState, UserLoginSuccess>(_userLoginRequestSuccess),
  TypedReducer<AuthState, UserLoaded>(_userLoaded),
  TypedReducer<AuthState, UserLoginFailure>(_userLoginRequestFailure),
  TypedReducer<AuthState, UserLogout>(_userLogout),
  TypedReducer<AuthState, CreateUserRequest>(_createUserRequest),
  TypedReducer<AuthState, CreateUserSuccess>(_createUserSuccess),
  TypedReducer<AuthState, CreateUserFailure>(_createUserFailure),
]);

AuthState _userLoginRequest(AuthState state, UserLoginRequest action) {
  return state.rebuild((AuthStateBuilder b) => b
    ..isLoading = true
  );
}

AuthState _userLoginRequestSuccess(AuthState state, UserLoginSuccess action) {
  return state.rebuild((AuthStateBuilder b) => b
    ..isLoading = false
  );
}

AuthState _userLoaded(AuthState state, UserLoaded action) {
  return state.rebuild((AuthStateBuilder b) => b
    ..isLoading = false
    ..isAuthenticated = true
    ..user.replace(action.user)
  );
}

AuthState _userLoginRequestFailure(AuthState state, UserLoginFailure action) {
  return state.rebuild((AuthStateBuilder b) => b
    ..isLoading = false
    ..error = action.error
  );
}

AuthState _userLogout(AuthState state, UserLogout action) {
  return state.rebuild((AuthStateBuilder b) => b
    ..isLoading = false
    ..isAuthenticated = false
    ..user = null
  );
}

AuthState _createUserRequest(AuthState state, CreateUserRequest action) {
  return state.rebuild((AuthStateBuilder b) => b
    ..isLoading = true
  );
}

AuthState _createUserSuccess(AuthState state, CreateUserSuccess action) {
  return state.rebuild((AuthStateBuilder b) => b
    ..isLoading = false
  );
}
AuthState _createUserFailure(AuthState state, CreateUserFailure action) {
  return state.rebuild((AuthStateBuilder b) => b
    ..isLoading = false
    ..error = action.error
  );
}