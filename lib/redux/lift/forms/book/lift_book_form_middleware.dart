import 'package:redux/redux.dart';

import 'lift_book_form_actions.dart';
import '../../../app/app_state.dart';
import '../../../../data/repository.dart';

class LiftBookFormMiddleware {
  final Repository repository;
  const LiftBookFormMiddleware(this.repository);

  List<Middleware<AppState>> createLiftBookFormMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, LiftBookFormStart>(_loadLiftSlots),
    ];
  }

  void _loadLiftSlots(Store<AppState> store, LiftBookFormStart action, NextDispatcher next) async {
    next(action);

    try {
      final dynamic data = await repository.fetchLiftSlots(store.state.liftState.selectedId);
      final List<DateTime> liftSlots = List<DateTime>.from(data.map<dynamic>((dynamic x) => DateTime.parse(x)));
      store.dispatch(LoadLiftSlotsSuccess(liftSlots: liftSlots));
    } catch (e) {
      store.dispatch(LoadLiftSlotsFailure(error: e.toString()));
    }
  }
}
