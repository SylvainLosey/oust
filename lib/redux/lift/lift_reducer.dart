import 'package:redux/redux.dart';

import '../../data/models/lift.dart';
import '../../data/models/lift_image.dart';
import '../../data/models/lift_event.dart';

import 'lift_state.dart';
import 'lift_actions.dart';

Reducer<LiftState> liftReducer = combineReducers([
  TypedReducer<LiftState, LoadLiftsRequest>(_incrementFetchCount),
  TypedReducer<LiftState, LoadLiftsSuccess>(_loadLiftsSuccess),
  TypedReducer<LiftState, LoadLiftsFailure>(_loadLiftsFailure),
  TypedReducer<LiftState, LoadLiftImagesRequest>(_incrementFetchCount),
  TypedReducer<LiftState, LoadLiftImagesSuccess>(_loadLiftImagesSuccess),
  TypedReducer<LiftState, LoadLiftImagesFailure>(_loadLiftImagesFailure),
  TypedReducer<LiftState, LoadLiftEventsRequest>(_incrementFetchCount),
  TypedReducer<LiftState, LoadLiftEventsSuccess>(_loadLiftEventsSuccess),
  TypedReducer<LiftState, LoadLiftEventsFailure>(_loadLiftEventsFailure),
  TypedReducer<LiftState, ViewLiftDetail>(_viewLiftDetail),
  TypedReducer<LiftState, UpdateLiftRequest>(_incrementFetchCount),
  TypedReducer<LiftState, UpdateLiftSuccess>(_updateLiftSuccess),
  TypedReducer<LiftState, UpdateLiftFailure>(_setError),
  TypedReducer<LiftState, CreateLiftEventRequest>(_createLiftEventRequest),
  TypedReducer<LiftState, CreateLiftEventSuccess>(_createLiftEventSuccess),
  TypedReducer<LiftState, CreateLiftEventFailure>(_setError),
]);

LiftState _incrementFetchCount(LiftState state, dynamic action) {
  return state.rebuild((b) => b..fetchCount = state.fetchCount + 1);
}

LiftState _setError(LiftState state, dynamic action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount - 1
    ..error = action.error);
}

LiftState _createLiftEventRequest(LiftState state, dynamic action) {
  return state.rebuild((b) => b..fetchCount = state.fetchCount + 1);
}

LiftState _createLiftEventSuccess(LiftState state, dynamic action) {
  return state.rebuild((b) => b..fetchCount = state.fetchCount - 1);
}

LiftState _loadLiftsSuccess(LiftState state, LoadLiftsSuccess action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount - 1
    ..lifts.replace(Map<int, Lift>.fromIterable(
      action.lifts,
      key: (dynamic lift) => lift.id,
      value: (dynamic lift) => lift,
    )));
}

LiftState _loadLiftsFailure(LiftState state, LoadLiftsFailure action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount - 1
    ..error = action.error);
}

LiftState _loadLiftImagesSuccess(LiftState state, LoadLiftImagesSuccess action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount - 1
    ..liftImages.replace(Map<int, LiftImage>.fromIterable(
      action.liftImages,
      key: (dynamic liftImage) => liftImage.id,
      value: (dynamic liftImage) => liftImage,
    )));
}

LiftState _loadLiftImagesFailure(LiftState state, LoadLiftImagesFailure action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount - 1
    ..error = action.error);
}

LiftState _loadLiftEventsSuccess(LiftState state, LoadLiftEventsSuccess action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount - 1
    ..liftEvents.replace(Map<int, LiftEvent>.fromIterable(
      action.liftEvents,
      key: (dynamic liftEvent) => liftEvent.id,
      value: (dynamic liftEvent) => liftEvent,
    )));
}

LiftState _loadLiftEventsFailure(LiftState state, LoadLiftEventsFailure action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount - 1
    ..error = action.error);
}

LiftState _viewLiftDetail(LiftState state, ViewLiftDetail action) {
  return state.rebuild((b) => b..selectedId = action.liftId);
}

LiftState _updateLiftSuccess(LiftState state, UpdateLiftSuccess action) {
  return state.rebuild((b) => b
    ..fetchCount = state.fetchCount - 1
    ..lifts[action.lift.id] = action.lift);
}
