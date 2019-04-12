import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../subscription/form/subscription_form_actions.dart';
import '../app/app_state.dart';

class NavMiddleware {
  final GlobalKey<NavigatorState> navigatorKey;

  const NavMiddleware(this.navigatorKey);

  List<Middleware<AppState>> createNavMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, SubscriptionFormStart>(_subscriptionFormStart),
      TypedMiddleware<AppState, SubscriptionFormNextStep>(_subscriptionFormNextStep),
      TypedMiddleware<AppState, SubscriptionFormPreviousStep>(_subscriptionFormPreviousStep),
      TypedMiddleware<AppState, SubscriptionFormExit>(_subscriptionFormExit),
    ];
  }


  void _subscriptionFormStart(Store<AppState> store, SubscriptionFormStart action, NextDispatcher next) async{
    next(action);

    // We want to navigate the user to the current step if he has started the form already
    // Therefore if he hasn't started it yet, the reducer will intercept first and increment currentStep from 0 to 1, and this will navigate to step 1
    // Otherwise, we push him to his current step. We push all intermediate routes to the navigator so that we can navigate back with pop()
    final int currentStep = store.state.subscriptionFormState.subscriptionForm.currentStep;
    int pushCounter = 1;

    while (pushCounter <= currentStep) {
      final String route = '/subscription/form/$pushCounter';
      navigatorKey.currentState.pushNamed(route);
      pushCounter = pushCounter + 1;
    }
  }


  void _subscriptionFormNextStep(Store<AppState> store, SubscriptionFormNextStep action, NextDispatcher next) async{
    final String route = '/subscription/form/${store.state.subscriptionFormState.subscriptionForm.currentStep + 1}';
    navigatorKey.currentState.pushNamed(route);

    next(action);
  }


  void _subscriptionFormPreviousStep(Store<AppState> store, SubscriptionFormPreviousStep action, NextDispatcher next) async{    
    navigatorKey.currentState.pop();

    next(action);
  }


  void _subscriptionFormExit(Store<AppState> store, SubscriptionFormExit action, NextDispatcher next) async{    
    navigatorKey.currentState.popUntil(ModalRoute.withName('/'));

    next(action);
  }
}