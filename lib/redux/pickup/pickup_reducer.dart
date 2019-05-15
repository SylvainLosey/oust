import 'package:redux/redux.dart';

import '../../data/models/pickup.dart';
import 'pickup_actions.dart';
import 'pickup_state.dart';

Reducer<PickupState> pickupReducer = combineReducers([
  TypedReducer<PickupState, LoadPickupsRequest>(_loadPickupsRequest),
  TypedReducer<PickupState, LoadPickupsSuccess>(_loadPickupsSuccess),
  TypedReducer<PickupState, LoadPickupsFailure>(_loadPickupsFailure),
  TypedReducer<PickupState, UpdatePickupRequest>(_updatePickupRequest),
  TypedReducer<PickupState, UpdatePickupSuccess>(_updatePickupSuccess),
  TypedReducer<PickupState, UpdatePickupFailure>(_updatePickupFailure),
  TypedReducer<PickupState, DeletePickupRequest>(_deletePickupRequest),
  TypedReducer<PickupState, DeletePickupSuccess>(_deletePickupSuccess),
  TypedReducer<PickupState, DeletePickupFailure>(_deletePickupFailure),
  TypedReducer<PickupState, PushBackPickupRequest>(_pushBackPickupRequest),
  TypedReducer<PickupState, PushBackPickupSuccess>(_pushBackPickupSuccess),
  TypedReducer<PickupState, PushBackPickupFailure>(_pushBackPickupFailure),
]);


PickupState _loadPickupsRequest(PickupState state, LoadPickupsRequest action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = true
  );
}

PickupState _loadPickupsSuccess(PickupState state, LoadPickupsSuccess action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = false
    ..pickups.replace(Map<int, Pickup>.fromIterable(
      action.pickups,
      key: (dynamic pickup) => pickup.id,
      value: (dynamic pickup) => pickup,
    ))
  );
}

PickupState _loadPickupsFailure(PickupState state, LoadPickupsFailure action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = false
    ..error = action.error
  );
}


PickupState _updatePickupRequest(PickupState state, UpdatePickupRequest action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = true,
  );
}

PickupState _updatePickupSuccess(PickupState state, UpdatePickupSuccess action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = false,
  );
}

PickupState _updatePickupFailure(PickupState state, UpdatePickupFailure action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = false
    ..error = action.error
  );
}


PickupState _deletePickupRequest(PickupState state, DeletePickupRequest action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = true,
  );
}

PickupState _deletePickupSuccess(PickupState state, DeletePickupSuccess action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = false,
  );
}

PickupState _deletePickupFailure(PickupState state, DeletePickupFailure action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = false
    ..error = action.error
  );
}


PickupState _pushBackPickupRequest(PickupState state, PushBackPickupRequest action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = true,
  );
}

PickupState _pushBackPickupSuccess(PickupState state, PushBackPickupSuccess action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = false,
  );
}

PickupState _pushBackPickupFailure(PickupState state, PushBackPickupFailure action) {
  return state.rebuild((PickupStateBuilder b) => b
    ..isLoading = false
    ..error = action.error
  );
}