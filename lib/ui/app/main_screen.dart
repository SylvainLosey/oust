import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../redux/app/app_state.dart';
import '../account/profile_screen.dart';
import '../lift/lifts_screen.dart';
import '../subscription/subscription_screen.dart';
import 'bottom_nav.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final List<Widget> _views = <Widget>[
      LiftsScreen(),
      SubscriptionScreen(),
      ProfileScreen(),
    ];

    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Scaffold(
          body: _views[viewModel.selectedBottomNav],
          bottomNavigationBar: BottomNav(),
        );
      }
    );
  }
}

// Widget _getScreen(int selectedScreen) {
//   switch (selectedScreen) {
//     case 0: return LiftsScreen();
//     case 1: return SubscriptionScreen();
//     case 3: return ProfileScreen();
//   }
// }

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

