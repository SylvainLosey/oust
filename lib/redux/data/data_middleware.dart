import 'package:redux/redux.dart';

import 'data_actions.dart';
import '../app/app_state.dart';
import '../../data/models/package.dart';
import '../../data/models/postcode.dart';
import '../../data/repository.dart';

class DataMiddleware {
  final Repository repository;
  const DataMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createDataMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, LoadPackagesRequest>(_loadPackages),
      TypedMiddleware<AppState, LoadPostcodesRequest>(_loadPostcodes),
    ];
  }

  void _loadPackages(Store<AppState> store, LoadPackagesRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> data = await repository.fetchPackages();
      final List<Package> packages = List<Package>.from(data.map<dynamic>((dynamic x) => Package.fromJson(x)));
      store.dispatch(LoadPackagesSuccess(packages: packages));
    } catch (e) {
      store.dispatch(LoadPackagesFailure(error: e.toString()));
    }
  }

  void _loadPostcodes(Store<AppState> store, LoadPostcodesRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> data = await repository.fetchPostcodes();
      final List<Postcode> postcodes = List<Postcode>.from(data.map<dynamic>((dynamic x) => Postcode.fromJson(x)));
      store.dispatch(LoadPostcodesSuccess(postcodes: postcodes));
    } catch (e) {
      store.dispatch(LoadPostcodesFailure(error: e.toString()));
    }
  }
}