import 'package:redux/redux.dart';

import '../../data/models/postcode.dart';
import '../../data/models/package.dart';
import 'data_actions.dart';
import 'data_state.dart';

Reducer<DataState> dataReducer = combineReducers([
  TypedReducer<DataState, LoadPostcodesRequest>(_loadPostcodesRequest),
  TypedReducer<DataState, LoadPostcodesSuccess>(_loadPostcodesSuccess),
  TypedReducer<DataState, LoadPostcodesFailure>(_loadPostcodesFailure),
  TypedReducer<DataState, LoadPackagesRequest>(_loadPackagesRequest),
  TypedReducer<DataState, LoadPackagesSuccess>(_loadPackagesSuccess),
  TypedReducer<DataState, LoadPackagesFailure>(_loadPackagesFailure),
]);


DataState _loadPostcodesRequest(DataState state, LoadPostcodesRequest action) {
  return state.rebuild((DataStateBuilder b) => b
    ..fetchCount = state.fetchCount + 1
  );
}

DataState _loadPostcodesSuccess(DataState state, LoadPostcodesSuccess action) {
  return state.rebuild((DataStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..postcodes.replace(Map<int, Postcode>.fromIterable(
      action.postcodes,
      key: (dynamic pickup) => pickup.id,
      value: (dynamic pickup) => pickup,
    ))
  );
}

DataState _loadPostcodesFailure(DataState state, LoadPostcodesFailure action) {
  return state.rebuild((DataStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..error = action.error
  );
}

/// PACKAGES

DataState _loadPackagesRequest(DataState state, LoadPackagesRequest action) {
  return state.rebuild((DataStateBuilder b) => b
    ..fetchCount = state.fetchCount + 1
  );
}

DataState _loadPackagesSuccess(DataState state, LoadPackagesSuccess action) {
  return state.rebuild((DataStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..packages.replace(Map<int, Package>.fromIterable(
      action.packages,
      key: (dynamic package) => package.id,
      value: (dynamic package) => package,
    ))
  );
}

DataState _loadPackagesFailure(DataState state, LoadPackagesFailure action) {
  return state.rebuild((DataStateBuilder b) => b
    ..fetchCount = state.fetchCount -1
    ..error = action.error
  );
}