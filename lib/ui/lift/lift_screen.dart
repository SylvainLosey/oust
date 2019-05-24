import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'lift_empty.dart';
import 'lift_home.dart';
import '../../redux/app/app_state.dart';
import '../../data/models/customer.dart';

class LiftScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.customer != null && viewModel.customer.hasLift) {
          return LiftHome();
        } else {
          return LiftEmpty();
        }
      },
    );
  }
}

class _ViewModel {
  final Customer customer;

  _ViewModel({
    @required this.customer,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      customer: store.state.customerState.customer,
    );
  }
}
