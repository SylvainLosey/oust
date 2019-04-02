
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../account/customer_details.dart';
import '../auth/logout_button.dart';
import '../../redux/app/app_state.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.isAuthenticated) {
          return Center(
            child: Column(
              children: <Widget>[
                Container(height: 200),
                CustomerDetails(),
                LogoutButton(),
              ],)
            );
        } else {
          return LoginScreen();
        }
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