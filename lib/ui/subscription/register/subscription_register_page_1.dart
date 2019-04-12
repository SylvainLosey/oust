import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../redux/app/app_state.dart';
import '../../../data/models/subscription_register.dart';
import '../../../utils/colors.dart';
import '../../../redux/subscription/register/subscription_register_actions.dart';

class SubscriptionRegisterPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: backgroundColor,
            elevation: 0.0,
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Text('Welcome to the subscription form Page 1 !'),
                RaisedButton(
                  child: Text('Continue'),
                  onPressed: viewModel.nextStep
                )
              ],
            )
          )
        
        );
      },
    );
  }
}


@immutable
class _ViewModel {
  final SubscriptionRegister subscriptionRegister;
  final Function nextStep;
  final Function previousStep;


  _ViewModel({
    this.subscriptionRegister,
    this.nextStep,
    this.previousStep,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionRegister: store.state.subscriptionRegisterState.subscriptionRegister,
      nextStep: () => store.dispatch(SubscriptionRegisterNextStep()),
      previousStep: () => store.dispatch(SubscriptionRegisterPreviousStep())
     );
  }
}
