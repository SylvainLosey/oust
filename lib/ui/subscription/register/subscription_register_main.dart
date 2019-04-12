import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../redux/app/app_state.dart';
import '../../../data/models/subscription_register.dart';
import '../../../utils/colors.dart';

import 'subscription_register_page_1.dart';
import 'subscription_register_page_2.dart';

class SubscriptionRegisterMain extends StatelessWidget {

  final Map<int, Widget> _page = <int, Widget>{
    1: SubscriptionRegisterPage1(),
    2: SubscriptionRegisterPage2(),
  };

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return _page[viewModel.subscriptionRegister.currentStep];
      }
    );
  }
}


@immutable
class _ViewModel {
  final SubscriptionRegister subscriptionRegister;

  _ViewModel({
    this.subscriptionRegister,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionRegister: store.state.subscriptionRegisterState.subscriptionRegister,
     );
  }
}
