import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_actions.dart';
import '../customer/customer_actions.dart';
import '../subscription/subscription_actions.dart';
import '../data/data_actions.dart';
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
      TypedMiddleware<AppState, CreateUserRequest>(_createUserRequest),
    ];
  }

  void _appStarted(Store<AppState> store, AppStarted action, NextDispatcher next) async {
    next(action);

    if (await _hasAuthData()) {
      final Map<String, dynamic> authData = await _getAuthData();
      store.dispatch(UserLoaded(
        shoudlLoadCustomer: true,
        user: User((UserBuilder b) => b
          ..key = authData['key']
          ..id = authData['id']
        )
      ));
    }
    store.dispatch(LoadPackagesRequest());

    // Let app load 2 seconds and load this after as this is low priority
    await Future<void>.delayed(const Duration(seconds: 2), () {
      store.dispatch(LoadPostcodesRequest());
    });
  }

  void _userLoginRequest(Store<AppState> store, UserLoginRequest action, NextDispatcher next) async {
    next(action);

    try {
      final Map<String, dynamic> authData = await repository.login(action.email, action.password);

      _persistAuthData(authData['key'], authData['user']);

      store.dispatch(UserLoginSuccess(
        key: authData['key'],
        id: authData['user'],
      ));
    } catch (e) {
      store.dispatch(UserLoginFailure(error: e.toString()));
    }
  }


  void _userLoginSuccess(Store<AppState> store, UserLoginSuccess action, NextDispatcher next) async {
    next(action);

    store.dispatch(UserLoaded(
      shoudlLoadCustomer: true,
      user: User((UserBuilder b) => b
          ..key = action.key
          ..id = action.id
        )
      )
    );
  }


  void _userLoaded(Store<AppState> store, UserLoaded action, NextDispatcher next) async {
    next(action);
    
    if (action.shoudlLoadCustomer) {
      store.dispatch(LoadCustomerRequest(user: action.user));
    }
  }


  void _userLogout(Store<AppState> store, UserLogout action, NextDispatcher next) async {
    await _deleteAuthData();
    store.dispatch(AppStarted());

    next(action);
  }


  void _createUserRequest(Store<AppState> store, CreateUserRequest action, NextDispatcher next) async {
    next(action);

    try {
      final Map<String, dynamic> data = await repository.createUser(action.email, action.password);
      _persistAuthData(data['key'], data['user']);

      store.dispatch(CreateUserSuccess());
      store.dispatch(UserLoaded(
        shoudlLoadCustomer: false,
        user: User((UserBuilder b) => b
            ..key = data['key']
            ..id = data['user']
          )
        )
      );
      print(data['user']);
      action.completer.complete(data['user']);
    } catch (e) {
      store.dispatch(CreateUserFailure(error: e.toString()));
      action.completer.completeError(e.toString());
    }
  }

  /// HELPER FUNCTIONS
  
  Future<Map<String, dynamic>> _getAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> authData = <String, dynamic>{
      'key': prefs.getString('key'),
      'id': prefs.getInt('id'),
    };

    return authData;
  }

  Future<void> _deleteAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('key');
    await prefs.remove('id');
  }

  Future<void> _persistAuthData(String key, int id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('key', key);
    await prefs.setInt('id', id);
  }

  Future<bool> _hasAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String key = prefs.getString('key') ?? '';

    if (key != '') {
      return true;
    } else {
    return false;
    }
  }
}