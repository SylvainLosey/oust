import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'redux/app/app_state.dart';
import 'utils/layout.dart';
import 'utils/theme.dart';
import 'utils/routes.dart';
import 'utils/localizations.dart';



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
          theme: appTheme(),
          title: 'Oust!',
          routes: getRoutes(context),
          supportedLocales: [
            const Locale('fr', ''),
            // const Locale('en', ''),
          ],
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
        )
      )
    );
  }
}


