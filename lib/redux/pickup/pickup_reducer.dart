import 'package:redux/redux.dart';

import '../../data/models/pickup.dart';
import 'pickup_actions.dart';
import 'pickup_state.dart';

Reducer<PickupState> pickupReducer = combineReducers([
  TypedReducer<PickupState, LoadPickupsRequest>(_loadPickupsRequest),
  TypedReducer<PickupState, LoadPickupsSuccess>(_loadPickupsSuccess),
  TypedReducer<PickupState, LoadPickupsFailure>(_loadPickupsFailure),
]);


PickupState _loadPickupsRequest(PickupState state, LoadPickupsRequest action) {
  return state.copyWith(
    isLoading: true,
  );
}

PickupState _loadPickupsSuccess(PickupState state, LoadPickupsSuccess action) {
  return state.copyWith(
    isLoading: false,
    pickups: Map<dynamic, Pickup>.fromIterable(
      action.pickups,
      key: (dynamic pickup) => pickup.id.toString(),
      value: (dynamic pickup) => pickup,
    ),
  );
}

PickupState _loadPickupsFailure(PickupState state, LoadPickupsFailure action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
  );
}