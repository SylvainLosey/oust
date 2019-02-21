import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

import '../middleware/app_middleware.dart';
import '../middleware/auth_middleware.dart';
import '../models/app_state.dart';
import '../reducers/app_reducer.dart';

Store<AppState> createStore(RemoteDevToolsMiddleware remoteDevtools) {
  return DevToolsStore<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
        ..addAll(AuthMiddleware().createAuthMiddleware())
        ..addAll(AppMiddleware().createAppMiddleware())
        ..add(remoteDevtools),
  );
}


// Store<AppState> createStore() {
//   return DevToolsStore<AppState>(
//     appReducer,
//     initialState: AppState.initial(),
//     middleware: []
//         ..addAll(AuthMiddleware().createAuthMiddleware())
//         ..addAll(AppMiddleware().createAppMiddleware())
//   );
// }