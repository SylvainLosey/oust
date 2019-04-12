import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../redux/app/app_state.dart';
import '../../../data/models/subscription_form.dart';
import '../../../utils/colors.dart';
import '../../../redux/subscription/form/subscription_form_actions.dart';


class SubscriptionFormPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {

        // WillPopScopre intercepts back button / gesture and disptaches previousStep action instead.
        // Route will be popped from Middlware so that we can adjust currentStep
        return WillPopScope(
          onWillPop: () async {
            viewModel.previousStep();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.close, size: 30,),
                  onPressed: viewModel.exit
                )
              ],
              brightness: Brightness.light,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              backgroundColor: backgroundColor,
              elevation: 0.0,
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Text('Welcome to the subscription form Page 2 !!'),
                  RaisedButton(
                    child: Text('Continue'),
                    onPressed: viewModel.nextStep
                  )
                ],
              )
            )
          )
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final Function nextStep;
  final Function previousStep;
  final Function exit;


  _ViewModel({
    this.subscriptionForm,
    this.nextStep,
    this.previousStep,
    this.exit
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
     );
  }
}
