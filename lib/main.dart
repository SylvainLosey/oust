import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';


import 'app.dart';
import 'middleware/app_middleware.dart';
import 'middleware/auth_middleware.dart';
import 'models/app_state.dart';
import 'reducers/app_state_reducer.dart';

// void main() async {
//   final RemoteDevToolsMiddleware remoteDevtools = RemoteDevToolsMiddleware('192.168.1.106:8000');
//   await remoteDevtools.connect();


//   final DevToolsStore<AppState> store = Store<AppState>(
  //   appReducer,
  //   initialState: AppState.initial(),
  //   middleware: []
  //       ..addAll(AuthMiddleware().createAuthMiddleware())
  //       ..addAll(AppMiddleware().createAppMiddleware())
  // );

//   remoteDevtools.store = store;
  
//   runApp(App(store));
// }




void main() {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
        ..addAll(AuthMiddleware().createAuthMiddleware())
        ..addAll(AppMiddleware().createAppMiddleware())
  );

  runApp(App(store));
}

