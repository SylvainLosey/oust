import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../redux/app/app_state.dart';
import '../../../data/models/subscription_form.dart';
import '../../../utils/colors.dart';
import '../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../utils/layout.dart';

class SubscriptionFormPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return WillPopScope(
          onWillPop: () async {
            viewModel.previousStep();
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              brightness: Brightness.light,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              backgroundColor: backgroundColor,
              elevation: 0.0,
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container()
                    ),
                    Expanded(
                      flex: 10,
                      child: Image.asset('assets/images/logo.png'),
                    ),

                    Expanded(
                      flex: 1,
                      child: Container()
                    ),
                    Column(
                      children: <Widget>[
                        Text('Fonctionnement', style: Theme.of(context).textTheme.title),
                        Container(height: Layout.of(context).gridUnit(1)),
                        Text('Nous passons collecter à ton domicile tous tes déchets triés, à la fréquence qui te convient.', textAlign: TextAlign.center,)
                      ],
                    ),
                    Expanded(
                      flex: 14,
                      child: Container(),
                    ),
                    RaisedButton(
                      child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
                      onPressed: viewModel.nextStep
                    ),
                  ],
                )
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

  _ViewModel({
    this.subscriptionForm,
    this.nextStep,
    this.previousStep,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep())
     );
  }
}
