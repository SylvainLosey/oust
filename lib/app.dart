import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


import 'redux/app/app_state.dart';
import 'ui/app/main_screen.dart';
import 'utils/layout.dart';
import 'utils/colors.dart';
import 'ui/subscription/subscription_screen.dart';
import 'ui/subscription/form/subscription_form_page_1.dart';
import 'ui/subscription/form/subscription_form_page_2.dart';


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
          theme: ThemeData(
          //  fontFamily: 'ProductSans',
            primaryColor: primaryColor,
            accentColor: accentColor,
            scaffoldBackgroundColor: backgroundColor,

            buttonTheme: ButtonThemeData(
              //minWidth: 300,
              //height: 40,
              buttonColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            )
          ),
          title: 'Oust!',
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => MainScreen(),
            '/subscription/': (BuildContext context) => SubscriptionScreen(),
            '/subscription/form/1': (BuildContext context) => SubscriptionFormPage1(),
            '/subscription/form/2': (BuildContext context) => SubscriptionFormPage2(),
          }
        )
      )
    );
  }
}
