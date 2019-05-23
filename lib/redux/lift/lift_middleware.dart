import 'package:redux/redux.dart';

import '../app/app_state.dart';
import '../lift/lift_actions.dart';
import '../../data/models/lift.dart';
import '../../data/models/lift_image.dart';
import '../../data/repository.dart';

class LiftMiddleware {
  final Repository repository;
  const LiftMiddleware(this.repository);

  List<Middleware<AppState>> createLiftMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, LoadLiftsRequest>(_loadLiftsRequest),
      TypedMiddleware<AppState, LoadLiftImagesRequest>(_loadLiftImagesRequest),
      TypedMiddleware<AppState, CreateLiftRequest>(_createLiftRequest),
      TypedMiddleware<AppState, CreateLiftImageRequest>(_createLiftImageRequest),
    ];
  }

  void _loadLiftsRequest(Store<AppState> store, LoadLiftsRequest action, NextDispatcher next) async {
    next(action);

    try {
      final List<dynamic> data = await repository.fetchLifts(action.customer.id);
      store.dispatch(LoadLiftsSuccess(lifts: List<Lift>.from(data.map((x) => Lift.fromJson(x)))));
    } catch (e) {
      store.dispatch(LoadLiftsFailure(error: e.toString()));
    }
  }

  void _loadLiftImagesRequest(Store<AppState> store, LoadLiftImagesRequest action, NextDispatcher next) async {
    next(action);

    try {
      final List<dynamic> data = await repository.fetchLiftImages(action.customer.id);
      store.dispatch(LoadLiftImagesSuccess(liftImages: List<LiftImage>.from(data.map((x) => LiftImage.fromJson(x)))));
    } catch (e) {
      store.dispatch(LoadLiftImagesFailure(error: e.toString()));
    }
  }

  void _createLiftRequest(Store<AppState> store, CreateLiftRequest action, NextDispatcher next) async {
    next(action);

    try {
      final Lift lift = Lift((b) => b
        ..customer = action.customerId
        ..floor = action.floor
        ..elevator = action.elevator
        ..customerNote = action.customerNote
        ..status = 'CREATED');

      final Map<String, dynamic> data = await repository.createLift(lift);
      store.dispatch(CreateLiftSuccess());
      action.completer.complete(data['id']);
    } catch (e) {
      store.dispatch(CreateLiftFailure(error: e.toString()));
      action.completer.completeError(e.toString());
    }
  }

  void _createLiftImageRequest(Store<AppState> store, CreateLiftImageRequest action, NextDispatcher next) async {
    next(action);

    try {
      final LiftImage liftImage = LiftImage((b) => b
        ..lift = action.liftId
        ..url = action.url
        ..uuid = action.uuid);

      await repository.createLiftImage(liftImage);
      store.dispatch(CreateLiftImageSuccess());
      action.completer.complete();
    } catch (e) {
      store.dispatch(CreateLiftImageFailure(error: e.toString()));
      action.completer.completeError(e.toString());
    }
  }
}
