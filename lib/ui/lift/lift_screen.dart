import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'lift_empty.dart';
import '../../redux/app/app_state.dart';

class LiftScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        // if (viewModel.isAuthenticated) {
        //   return SubscriptionHome();
        // } else {
        //   return SubscriptionEmpty();
        // }
        return LiftEmpty();
      },
    );
  }
}

class _ViewModel {
  final bool isAuthenticated;

  _ViewModel({
    @required this.isAuthenticated,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isAuthenticated: store.state.authState.isAuthenticated,
    );
  }
}
