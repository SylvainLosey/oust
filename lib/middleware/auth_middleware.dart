import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../actions/auth_actions.dart';
import '../models/app_state.dart';
import '../models/user.dart';
import '../services/repository.dart';

class AuthMiddleware {
  final Repository repository;

  const AuthMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createAuthMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, AppStarted>(_appStarted),
      TypedMiddleware<AppState, UserLoginRequest>(_login),
      TypedMiddleware<AppState, UserLoginSuccess>(_loginSuccess),
      TypedMiddleware<AppState, UserLogout>(_logout),
    ];
  }

  void _appStarted(Store<AppState> store, AppStarted action, NextDispatcher next) async {
    next(action);

    if (await _hasAuthData()) {
      final Map<String, dynamic> authData = await _getAuthData();
      store.dispatch(UserLoaded(
        user: User(token: authData['token'], id: authData['id'], email: authData['email'])
      ));
    }
  }


  void _login(Store<AppState> store, UserLoginRequest action, NextDispatcher next) async {
    next(action);

    try {
      final Map<String, dynamic> authData = await repository.login(action.email, action.password);
      print(authData);
      _persistAuthData(authData['token'], authData['id'], authData['email']);
      store.dispatch(UserLoginSuccess(
        token: authData['token'],
        id: authData['id'],
        email: authData['email']
      ));
    } catch (e) {
      store.dispatch(UserLoginFailure(error: e.toString()));
    }
  }

  void _loginSuccess(Store<AppState> store, UserLoginSuccess action, NextDispatcher next) async {
    next(action);

    store.dispatch(UserLoaded(
      user: User(token: action.token, id: action.id, email: action.email)
    ));
  }

  void _logout(Store<AppState> store, UserLogout action, NextDispatcher next) async {
    await _deleteTAuthData();

    next(action);
  }


  /// HELPER FUNCTIONS
  
  Future<Map<String, dynamic>> _getAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> authData = <String, dynamic>{
      'token': prefs.getString('token'),
      'id': prefs.getInt('id'),
      'email': prefs.getString('email'),
    };

    return authData;
  }

  Future<void> _deleteTAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('id');
    await prefs.remove('email');
    print('AuthData removed');
  }

  Future<void> _persistAuthData(String token, int id, String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('email', email);
    await prefs.setInt('id', id);
    print('AuthData persisted');
  }

  Future<bool> _hasAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';

    if (token != '') {
      return true;
    } else {
    return false;
    }
  }
}