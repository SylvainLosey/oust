import 'package:redux/redux.dart';

import 'app_state.dart';
import '../../data/repository.dart';


class AppMiddleware {
  final Repository repository;
  const AppMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createAppMiddleware() {
    return <Middleware<AppState>>[
      // TypedMiddleware<AppState, dynamic>(_logAction),
    ];
  }

  // void _logAction(Store<AppState> store, dynamic action, NextDispatcher next) {
  //   print(action);
  //   next(action);
  // }
}