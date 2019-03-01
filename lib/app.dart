import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'models/app_state.dart';
import 'screens/screens.dart';
import 'services/colors.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getTheme(),
        title: 'Oust!',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => MainScreen()
        }
      )
    );
  }

  // ThemeData getTheme() {
  //   return ThemeData(
  //     brightness: Brightness.dark,
  //     fontFamily: 'ProductSans',
  //     primaryColor: darkPrimaryColor,
  //     accentColor: darkAccentColor,
  //     canvasColor: darkBackgroundColor,
  //     scaffoldBackgroundColor: darkBackgroundColor,
  //     cardColor: darkCardColor,
  //     dividerColor: darkDividerColor,
  //     dialogBackgroundColor: darkCardColor,
  //   );
  // }
  ThemeData getTheme() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'ProductSans',
      primaryColor: lightPrimaryColor,
      accentColor: lightAccentColor,
      dividerColor: lightDividerColor,
      canvasColor: lightBackgroundColor,
      scaffoldBackgroundColor: lightBackgroundColor,
    );
  }
}
