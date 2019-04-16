import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';


import 'app.dart';
import 'redux/app/app_middleware.dart';
import 'redux/auth/auth_middleware.dart';
import 'redux/nav/nav_middleware.dart';
import 'redux/app/app_state.dart';
import 'redux/app/app_reducer.dart';
import 'redux/auth/auth_actions.dart';

void main() async {
  // debugPaintSizeEnabled=true;

  final RemoteDevToolsMiddleware remoteDevtools = RemoteDevToolsMiddleware('192.168.1.106:8000');
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: []
        ..addAll(AuthMiddleware().createAuthMiddleware())
        ..addAll(AppMiddleware().createAppMiddleware())
        ..addAll(NavMiddleware(navigatorKey).createNavMiddleware())
        ..add(remoteDevtools)
  );

  remoteDevtools.store = store;
  await remoteDevtools.connect();
  
  runApp(App(store, navigatorKey));
  store.dispatch(AppStarted());
}
