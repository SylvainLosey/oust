import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


import 'models/app_state.dart';
import 'presentation/layout.dart';
import 'presentation/theme.dart';
import 'screens/screens.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: LayoutContainer(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: whiteTheme,
          title: 'Oust!',
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => MainScreen()
          }
        )
      )
    );
  }
}
