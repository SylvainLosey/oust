import 'package:redux/redux.dart';

import 'pickup_actions.dart';
import '../app/app_state.dart';
import '../../data/models/pickup.dart';
import '../../data/repository.dart';

class PickupMiddleware {
  final Repository repository;
  const PickupMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createPickupMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, LoadPickupsRequest>(_loadPickups),
    ];
  }

  void _loadPickups(Store<AppState> store, LoadPickupsRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> pickupsData = await repository.fetchPickups(action.subscription.id);
      store.dispatch(LoadPickupsSuccess(pickups: List<Pickup>.from(pickupsData.map<dynamic>((dynamic x) => Pickup.fromJson(x)))));
    } catch (e) {
      store.dispatch(LoadPickupsFailure(error: e.toString()));
    }
  }
}