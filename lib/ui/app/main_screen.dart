import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:oust/redux/auth/auth_actions.dart';
import 'package:redux/redux.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../redux/app/app_state.dart';
import '../account/profile_screen.dart';
import '../lift/lift_screen.dart';
import '../subscription/subscription_screen.dart';
import 'bottom_nav.dart';

class MainScreen extends StatefulWidget {
  final List<Widget> tabs = <Widget>[
    LiftScreen(),
    SubscriptionScreen(),
    ProfileScreen(),
  ];

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (BuildContext context, _ViewModel viewModel) {
          return Scaffold(
            body: widget.tabs[viewModel.selectedBottomNav],
            bottomNavigationBar: BottomNav(),
          );
        });
  }

  @override
  void didChangeDependencies() {
    _firebaseMessaging
        .requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.getToken().then((token) {});
    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {});

    final store = StoreProvider.of<AppState>(context);

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        // TODO: Use a notification inside the app which reloads when clicked
        store.dispatch(AppStarted());
      },
      onResume: (Map<String, dynamic> message) async {
        store.dispatch(AppStarted());
        // TODO: Navigate to corresponding lift details
      },
      onLaunch: (Map<String, dynamic> message) async {
        store.dispatch(AppStarted());
        // TODO: Navigate to corresponding lift details
      },
    );
    super.didChangeDependencies();
  }
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
