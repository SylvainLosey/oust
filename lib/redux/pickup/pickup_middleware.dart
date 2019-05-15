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
      TypedMiddleware<AppState, UpdatePickupRequest>(_updatePickupRequest),
      TypedMiddleware<AppState, DeletePickupRequest>(_deletePickupRequest),
      TypedMiddleware<AppState, PushBackPickupRequest>(_pushBackPickupRequest),
    ];
  }

  void _loadPickups(Store<AppState> store, LoadPickupsRequest action, NextDispatcher next) async {
    next(action);

    try {
      final List<dynamic> pickupsData = await repository.fetchPickups(action.subscription.id);
      store.dispatch(LoadPickupsSuccess(pickups: List<Pickup>.from(pickupsData.map<dynamic>((dynamic x) => Pickup.fromJson(x)))));
    } catch (e) {
      store.dispatch(LoadPickupsFailure(error: e.toString()));
    }
  }

  void _updatePickupRequest(Store<AppState> store, UpdatePickupRequest action , NextDispatcher next) async {
    next(action);

    try {
      await repository.updatePickup(action.pickup);
      store.dispatch(UpdatePickupSuccess());
    } catch (e) {
      store.dispatch(UpdatePickupFailure(error: e.toString()));
    }
  }
  

  void _deletePickupRequest(Store<AppState> store, DeletePickupRequest action, NextDispatcher next) async {
    try {
      await repository.deletePickup(action.pickup.id);
      store.dispatch(DeletePickupSuccess());
      store.dispatch(LoadPickupsRequest(subscription: store.state.subscriptionState.subscription));
    } catch (e) {
      store.dispatch(DeletePickupFailure(error: e.toString()));
    }
  }

  void _pushBackPickupRequest(Store<AppState> store, PushBackPickupRequest action, NextDispatcher next) async {
    next(action);

    try {
      await repository.pushBackDate(action.pickup.id);
      store.dispatch(PushBackPickupSuccess());
      store.dispatch(LoadPickupsRequest(subscription: store.state.subscriptionState.subscription));
    } catch (e) {
      store.dispatch(PushBackPickupFailure(error: e.toString()));
    }
  }
}