import 'package:flutter/material.dart';

import '../ui/app/main_screen.dart';
import '../ui/subscription/subscription_screen.dart';

import '../ui/subscription/form/info/subscription_form_infos.dart';
import '../ui/subscription/form/page/subscription_form_pages.dart';

// Se store steps inside a static int of the class to be able to reorder steps and not lose conditional navigation
Map<String, WidgetBuilder> getRoutes(BuildContext context) {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => MainScreen(),
    '/subscription/': (BuildContext context) => SubscriptionScreen(),
    '/subscription/form/${SubscriptionFormHowItWorks.step}': (BuildContext context) => SubscriptionFormHowItWorks(), // 1
    '/subscription/form/${SubscriptionFormQuantity.step}': (BuildContext context) => SubscriptionFormQuantity(), // 2
    '/subscription/form/${SubscriptionFormFrequency.step}': (BuildContext context) => SubscriptionFormFrequency(), // 3
    '/subscription/form/${SubscriptionFormName.step}': (BuildContext context) => SubscriptionFormName(), // 4
    '/subscription/form/${SubscriptionFormAddress.step}': (BuildContext context) => SubscriptionFormAddress(), //5
    '/subscription/form/${SubscriptionFormRegistrationMethod.step}': (BuildContext context) => SubscriptionFormRegistrationMethod(), // 6
    '/subscription/form/${SubscriptionFormContainersYesNo.step}': (BuildContext context) => SubscriptionFormContainersYesNo(), // 7
    '/subscription/form/${SubscriptionFormContainers.step}': (BuildContext context) => SubscriptionFormContainers(), // 8
    '/subscription/form/${SubscriptionFormLocation.step}': (BuildContext context) => SubscriptionFormLocation(), // 9
    '/subscription/form/${SubscriptionFormPhone.step}': (BuildContext context) => SubscriptionFormPhone(), // 10
    '/subscription/form/${SubscriptionFormStartDate.step}': (BuildContext context) => SubscriptionFormStartDate(), // 10
    '/subscription/form/${SubscriptionFormPaymentMethod.step}': (BuildContext context) => SubscriptionFormPaymentMethod(), // 10
    '/subscription/form/${SubscriptionFormPaymentInterval.step}': (BuildContext context) => SubscriptionFormPaymentInterval(), // 10
    '/subscription/form/${SubscriptionFormAccount.step}': (BuildContext context) => SubscriptionFormAccount(), // 10

    // Subscription unabailable - Lead track
    '/subscription/form/${SubscriptionFormLead.step}': (BuildContext context) => SubscriptionFormLead(), // 100
    '/subscription/form/${SubscriptionFormLeadSuccess.step}': (BuildContext context) => SubscriptionFormLeadSuccess(), // 101

    // Appointment requested
    '/subscription/form/${SubscriptionFormAppointment.step}': (BuildContext context) => SubscriptionFormAppointment(), // 200
    '/subscription/form/${SubscriptionFormAppointmentSuccess.step}': (BuildContext context) => SubscriptionFormAppointmentSuccess(), // 201
  };
}