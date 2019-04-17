import 'package:flutter/material.dart';

import '../ui/app/main_screen.dart';
import '../ui/subscription/subscription_screen.dart';
import '../ui/subscription/form/subscription_form_page_1.dart';
import '../ui/subscription/form/subscription_form_page_2.dart';
import '../ui/subscription/form/subscription_form_page_3.dart';
import '../ui/subscription/form/subscription_form_page_4.dart';
import '../ui/subscription/form/subscription_form_page_5.dart';
import '../ui/subscription/form/subscription_form_page_100.dart';
import '../ui/subscription/form/subscription_form_page_101.dart';


Map<String, WidgetBuilder> getRoutes(BuildContext context) {

  return <String, WidgetBuilder>{
    '/': (BuildContext context) => MainScreen(),
    '/subscription/': (BuildContext context) => SubscriptionScreen(),
    '/subscription/form/1': (BuildContext context) => SubscriptionFormHowItWorks(),
    '/subscription/form/2': (BuildContext context) => SubscriptionFormQuantity(),
    '/subscription/form/3': (BuildContext context) => SubscriptionFormName(),
    '/subscription/form/4': (BuildContext context) => SubscriptionFormAddress(),
    '/subscription/form/5': (BuildContext context) => SubscriptionFormPage5(),

    // Subscription unabailable - Lead track
    '/subscription/form/100': (BuildContext context) => SubscriptionFormLead(),
    '/subscription/form/101': (BuildContext context) => SubscriptionFormLeadSuccess(),
  };
}