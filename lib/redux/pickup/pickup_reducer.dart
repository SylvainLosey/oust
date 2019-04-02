import 'package:redux/redux.dart';

import 'pickup_actions.dart';
import 'pickup_state.dart';

Reducer<PickupState> pickupReducer = combineReducers([
  TypedReducer<PickupState, LoadPickupsAction>(_loadPickupsAction),
  TypedReducer<PickupState, LoadPickupsSuccess>(_loadPickupsSuccess),
  TypedReducer<PickupState, LoadPickupsFailure>(_loadPickupsFailure),
]);


PickupState _loadPickupsAction(PickupState state, LoadPickupsAction action) {
  return state.copyWith(
    isLoading: true,
  );
}

PickupState _loadPickupsSuccess(PickupState state, LoadPickupsSuccess action) {
  return state.copyWith(
    isLoading: false,
    pickups: action.pickups,
  );
}

PickupState _loadPickupsFailure(PickupState state, LoadPickupsFailure action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
  );
}