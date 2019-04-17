import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'redux/app/app_state.dart';
import 'utils/layout.dart';
import 'utils/theme.dart';
import 'utils/routes.dart';



class App extends StatelessWidget {
  final Store<AppState> store;
  final GlobalKey<NavigatorState> navigatorKey;

  App(this.store, this.navigatorKey);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: Layout(
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          title: 'Oust!',
          routes: getRoutes(context)
        )
      )
    );
  }
}


