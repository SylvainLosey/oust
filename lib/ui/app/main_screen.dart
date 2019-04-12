import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../redux/auth/auth_actions.dart';
import '../../redux/app/app_state.dart';
import 'bottom_nav.dart';
import '../lift/lifts_screen.dart';
import '../account/profile_screen.dart';
import '../subscription/subscription_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Widget> _views = [
      LiftsScreen(),
      SubscriptionScreen(),
      ProfileScreen(),
    ];

    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Scaffold(
          // appBar: _createAppBar(),
          body: _views[viewModel.selectedBottomNav],
          bottomNavigationBar: BottomNav(),
        );
      }
    );
  }

  // AppBar _createAppBar() {
  //   return AppBar(
  //     title: Text('Oust!'),
  //   );
  // }
}

class _ViewModel {
  final int selectedBottomNav;

  _ViewModel({
    @required this.selectedBottomNav,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      selectedBottomNav: store.state.navState.selectedBottomNav,
    );
  }
}

