import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_actions.dart';
import '../customer/customer_actions.dart';
import '../subscription/subscription_actions.dart';
import '../app/app_state.dart';
import '../../data/models/user.dart';
import '../../data/repository.dart';

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
        user: User(token: authData['token'], id: authData['id'])
      ));
    }
  }

  void _userLoginRequest(Store<AppState> store, UserLoginRequest action, NextDispatcher next) async {
    next(action);

    try {
      final Map<String, dynamic> authData = await repository.login(action.email, action.password);

      _persistAuthData(authData['key'], authData['user']);

      store.dispatch(UserLoginSuccess(
        token: authData['key'],
        id: authData['user'],
      ));
    } catch (e) {
      store.dispatch(UserLoginFailure(error: e.toString()));
    }
  }


  void _userLoginSuccess(Store<AppState> store, UserLoginSuccess action, NextDispatcher next) async {
    next(action);

    store.dispatch(UserLoaded(user: User(token: action.token, id: action.id)));
  }


  void _userLoaded(Store<AppState> store, UserLoaded action, NextDispatcher next) async {
    next(action);

    store.dispatch(LoadCustomerRequest(user: action.user));
    store.dispatch(LoadPackagesRequest());
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
    };

    return authData;
  }

  Future<void> _deleteAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('id');
  }

  Future<void> _persistAuthData(String token, int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
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