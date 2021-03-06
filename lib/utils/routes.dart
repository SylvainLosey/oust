import 'package:flutter/material.dart';
import 'package:oust/redux/lift/forms/book/lift_book_form_actions.dart';

import '../ui/app/main_screen.dart';
import '../ui/subscription/form/info/subscription_form_infos.dart';
import '../ui/subscription/form/page/subscription_form_pages.dart';
import '../ui/lift/forms/quote/pages/lift_quote_form_pages.dart';
import '../ui/lift/lift_detail_screen.dart';
import '../ui/lift/forms/book/pages/lift_book_form_pages.dart';

// Se store steps inside a static int of the class to be able to reorder steps and not lose conditional navigation
Map<String, WidgetBuilder> getRoutes(BuildContext context) {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => MainScreen(),
    '/lift/detail/': (BuildContext context) => LiftDetailScreen(),

    // NEW SUBSCRIPTION FORM
    for (var i = 0; i < subscriptionFormPages.length; i++)
      '/subscription/form/${i + 1}': (context) => subscriptionFormPages[i],

    // Unavailable in this postcode
    for (var i = 0; i < subscriptionFormUnavailable.length; i++)
      '/subscription/form/${i + 100}': (context) => subscriptionFormUnavailable[i],

    // Appointment requested
    for (var i = 0; i < subscriptionFormAppointment.length; i++)
      '/subscription/form/${i + 200}': (context) => subscriptionFormAppointment[i],

    // LIFT QUOTE FORM
    for (var i = 0; i < liftQuoteFormPages.length; i++) '/lift/form/quote/${i + 1}': (context) => liftQuoteFormPages[i],

    // Unavailable in this postcode
    for (var i = 0; i < liftFormUnavailable.length; i++)
      '/lift/form/quote/${i + 100}': (context) => liftFormUnavailable[i],

    // LIFT BOOK FORM
    for (var i = 0; i < liftBookFormPages.length; i++) '/lift/form/book/${i + 1}': (context) => liftBookFormPages[i],
  };

  return routes;
}

// SUBSSCRIPTION
List subscriptionFormPages = [
  SubscriptionFormHowItWorks(),
  SubscriptionFormQuantity(),
  SubscriptionFormFrequency(),
  SubscriptionFormName(),
  SubscriptionFormAddress(),
  SubscriptionFormRegistrationMethod(),
  SubscriptionFormContainersYesNo(),
  SubscriptionFormContainers(),
  SubscriptionFormLocation(),
  SubscriptionFormPhone(),
  SubscriptionFormStartDate(),
  SubscriptionFormPaymentMethod(),
  SubscriptionFormPaymentInterval(),
  SubscriptionFormAccount(),
  SubscriptionFormSubmit()
];

List subscriptionFormUnavailable = [
  SubscriptionFormLead(),
  SubscriptionFormLeadSuccess(),
];

List subscriptionFormAppointment = [
  SubscriptionFormAppointment(),
  SubscriptionFormAppointmentSuccess(),
];

// LIFT - QUOTE
List liftQuoteFormPages = [
  LiftQuoteFormImage(),
  LiftQuoteFormFloor(),
  LiftQuoteFormName(),
  LiftQuoteFormAddress(),
  LiftQuoteFormAccount(),
  LiftQuoteFormSubmit(),
];

List liftFormUnavailable = [
  LiftQuoteFormLead(),
  LiftQuoteFormLeadSuccess(),
];

// LIFT - BOOK

List liftBookFormPages = [
  LiftBookFormAccess(),
  LiftBookFormSlotPicker(),
  LiftBookFormPaymentMethod(),
  LiftBookFormSubmit(),
];
