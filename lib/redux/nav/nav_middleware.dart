import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../subscription/form/subscription_form_actions.dart';
import '../lift/forms/quote/lift_quote_form_actions.dart';
import '../lift/forms/book/lift_book_form_actions.dart';
import '../app/app_state.dart';
import '../../ui/subscription/form/page/subscription_form_pages.dart';
import '../../ui/lift/forms/quote/pages/lift_quote_form_pages.dart';
import '../lift/lift_actions.dart';

class NavMiddleware {
  final GlobalKey<NavigatorState> navigatorKey;

  const NavMiddleware(this.navigatorKey);

  List<Middleware<AppState>> createNavMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, SubscriptionFormStart>(_subscriptionFormStart),
      TypedMiddleware<AppState, SubscriptionFormNextStep>(_subscriptionFormNextStep),
      TypedMiddleware<AppState, SubscriptionFormPreviousStep>(formPreviousStep),
      TypedMiddleware<AppState, SubscriptionFormExit>(_formExit),
      TypedMiddleware<AppState, LiftQuoteFormStart>(_liftQuoteFormStart),
      TypedMiddleware<AppState, LiftQuoteFormNextStep>(_liftQuoteFormNextStep),
      TypedMiddleware<AppState, LiftQuoteFormPreviousStep>(formPreviousStep),
      TypedMiddleware<AppState, LiftQuoteFormExit>(_formExit),
      TypedMiddleware<AppState, ViewLiftDetail>(_viewLiftDetail),
      TypedMiddleware<AppState, LiftBookFormStart>(_liftBookFormStart),
      TypedMiddleware<AppState, LiftBookFormNextStep>(_liftBookFormNextStep),
      TypedMiddleware<AppState, LiftBookFormPreviousStep>(formPreviousStep),
      TypedMiddleware<AppState, LiftBookFormExit>(_formExit),
    ];
  }

  // START FORMS
  void _subscriptionFormStart(Store<AppState> store, SubscriptionFormStart action, NextDispatcher next) async {
    next(action);

    // We want to navigate the user to the current step if he has started the form already
    // Therefore if he hasn't started it yet, the reducer will intercept first and increment currentStep from 0 to 1, and this will navigate to step 1
    // Otherwise, we push him to his current step. We push all intermediate routes to the navigator so that we can navigate back with pop()
    final int currentStep = store.state.subscriptionFormState.subscriptionForm.currentStep;
    int pushCounter = 1;

    while (pushCounter <= currentStep) {
      final String route = '/subscription/form/$pushCounter';
      navigatorKey.currentState.pushNamed(route);

      // If we are at postcodes and previously user has entered an uncovered postcode, push him to 100 track
      if (pushCounter == SubscriptionFormAddress.step &&
          currentStep >= SubscriptionFormLead.step &&
          currentStep < SubscriptionFormAppointment.step) {
        pushCounter = SubscriptionFormLead.step;
      } else if (pushCounter == SubscriptionFormRegistrationMethod.step &&
          currentStep >= SubscriptionFormAppointment.step) {
        pushCounter = SubscriptionFormAppointment.step;
      } else if (pushCounter == SubscriptionFormContainersYesNo.step &&
          !store.state.subscriptionFormState.subscriptionForm.wantsContainers) {
        pushCounter = SubscriptionFormLocation.step;
      } else {
        pushCounter++;
      }
    }
  }

  void _liftQuoteFormStart(Store<AppState> store, LiftQuoteFormStart action, NextDispatcher next) async {
    next(action);

    final int currentStep = store.state.liftQuoteFormState.liftQuoteForm.currentStep;
    int pushCounter = 1;

    while (pushCounter <= currentStep) {
      final String route = '/lift/form/quote/$pushCounter';
      navigatorKey.currentState.pushNamed(route);

      // If we are at postcodes and previously user has entered an uncovered postcode, push him to 100 track
      if (pushCounter == LiftQuoteFormAddress.step && currentStep >= LiftQuoteFormLead.step) {
        pushCounter = LiftQuoteFormLead.step;
      } else if (store.state.authState.isAuthenticated && pushCounter == LiftQuoteFormFloor.step) {
        pushCounter = pushCounter + 2;
      } else {
        pushCounter++;
      }
    }
  }

  void _liftBookFormStart(Store<AppState> store, LiftBookFormStart action, NextDispatcher next) async {
    next(action);

    final int currentStep = store.state.liftBookFormState.liftBookForm.currentStep;
    int pushCounter = 1;

    while (pushCounter <= currentStep) {
      final String route = '/lift/form/book/$pushCounter';
      navigatorKey.currentState.pushNamed(route);

      pushCounter++;
    }
  }

  // NEXT STEP
  void _subscriptionFormNextStep(Store<AppState> store, SubscriptionFormNextStep action, NextDispatcher next) async {
    next(action);

    final String route = '/subscription/form/${store.state.subscriptionFormState.subscriptionForm.currentStep}';
    navigatorKey.currentState.pushNamed(route);
  }

  void _liftQuoteFormNextStep(Store<AppState> store, LiftQuoteFormNextStep action, NextDispatcher next) async {
    next(action);

    final String route = '/lift/form/quote/${store.state.liftQuoteFormState.liftQuoteForm.currentStep}';
    navigatorKey.currentState.pushNamed(route);
  }

  void _liftBookFormNextStep(Store<AppState> store, LiftBookFormNextStep action, NextDispatcher next) async {
    next(action);

    final String route = '/lift/form/book/${store.state.liftBookFormState.liftBookForm.currentStep}';
    navigatorKey.currentState.pushNamed(route);
  }

  // PREVIOUS STEP - Shared between forms
  void formPreviousStep(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    navigatorKey.currentState.pop();
  }

  // EXIT - Shared between forms
  void _formExit(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    navigatorKey.currentState.popUntil(ModalRoute.withName('/'));
  }

  void _viewLiftDetail(Store<AppState> store, ViewLiftDetail action, NextDispatcher next) async {
    next(action);

    navigatorKey.currentState.pushNamed('/lift/detail/');
  }
}
