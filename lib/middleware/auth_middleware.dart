import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../actions/auth_actions.dart';
import '../actions/customer_actions.dart';
import '../models/app_state.dart';
import '../models/user.dart';
import '../services/repository.dart';

class AuthMiddleware {
  final Repository repository;

  const AuthMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createAuthMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, AppStarted>(_appStarted),
      TypedMiddleware<AppState, UserLoginRequest>(_userLoginRequest),
      TypedMiddleware<AppState, UserLoginSuccess>(_userLoginSuccess),
      TypedMiddleware<AppState, UserLogout>(_userLogout),
      TypedMiddleware<AppState, UserLoaded>(_userLoaded),
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


  void _userLoginRequest(Store<AppState> store, UserLoginRequest action, NextDispatcher next) async {
    next(action);

    try {
      final Map<String, dynamic> authData = await repository.login(action.email, action.password);

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

  void _userLoginSuccess(Store<AppState> store, UserLoginSuccess action, NextDispatcher next) async {
    next(action);

    store.dispatch(UserLoaded(user: User(token: action.token, id: action.id, email: action.email)));
  }

  void _userLoaded(Store<AppState> store, UserLoaded action, NextDispatcher next) async {
    next(action);

    store.dispatch(LoadCustomerAction(user: action.user));
  }


  void _userLogout(Store<AppState> store, UserLogout action, NextDispatcher next) async {
    await _deleteAuthData();

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

  Future<void> _deleteAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('id');
    await prefs.remove('email');
  }

  Future<void> _persistAuthData(String token, int id, String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('email', email);
    await prefs.setInt('id', id);
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