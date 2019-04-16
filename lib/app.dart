import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


import 'redux/app/app_state.dart';
import 'ui/app/main_screen.dart';
import 'utils/layout.dart';
import 'utils/colors.dart';
import 'utils/theme.dart';
import 'ui/subscription/subscription_screen.dart';
import 'ui/subscription/form/subscription_form_page_1.dart';
import 'ui/subscription/form/subscription_form_page_2.dart';
import 'ui/subscription/form/subscription_form_page_3.dart';
import 'ui/subscription/form/subscription_form_page_4.dart';
import 'ui/subscription/form/subscription_form_page_5.dart';
import 'ui/subscription/form/subscription_form_page_100.dart';


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
          routes: <String, WidgetBuilder>{
            '/': (BuildContext context) => MainScreen(),
            '/subscription/': (BuildContext context) => SubscriptionScreen(),
            '/subscription/form/1': (BuildContext context) => SubscriptionFormPage1(),
            '/subscription/form/2': (BuildContext context) => SubscriptionFormPage2(),
            '/subscription/form/3': (BuildContext context) => SubscriptionFormPage3(),
            '/subscription/form/4': (BuildContext context) => SubscriptionFormPage4(),
            '/subscription/form/5': (BuildContext context) => SubscriptionFormPage5(),
            '/subscription/form/100': (BuildContext context) => SubscriptionFormPage100(),
          }
        )
      )
    );
  }
}


