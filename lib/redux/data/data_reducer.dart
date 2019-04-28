import 'package:redux/redux.dart';

import '../../data/models/postcode.dart';
import 'data_actions.dart';
import 'data_state.dart';

Reducer<DataState> dataReducer = combineReducers([
  TypedReducer<DataState, LoadPostcodesRequest>(_loadPostcodesRequest),
  TypedReducer<DataState, LoadPostcodesSuccess>(_loadPostcodesSuccess),
  TypedReducer<DataState, LoadPostcodesFailure>(_loadPostcodesFailure),
]);


DataState _loadPostcodesRequest(DataState state, LoadPostcodesRequest action) {
  return state.rebuild((DataStateBuilder b) => b
    ..isLoading = true
  );
}

DataState _loadPostcodesSuccess(DataState state, LoadPostcodesSuccess action) {
  return state.rebuild((DataStateBuilder b) => b
    ..isLoading = false
    ..postcodes.addAll(Map<int, Postcode>.fromIterable(
      action.postcodes,
      key: (dynamic pickup) => pickup.id,
      value: (dynamic pickup) => pickup,
    ))
  );
}

DataState _loadPostcodesFailure(DataState state, LoadPostcodesFailure action) {
  return state.rebuild((DataStateBuilder b) => b
    ..isLoading = false
    ..error = action.error
  );
}