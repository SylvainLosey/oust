import 'package:redux/redux.dart';

import 'app_state.dart';
import '../../data/repository.dart';

class AppMiddleware {
  final Repository repository;
  const AppMiddleware(this.repository);

  List<Middleware<AppState>> createAppMiddleware() {
    return <Middleware<AppState>>[];
  }
}
