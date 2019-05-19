import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../data/models/subscription_form.dart';
import '../../../../redux/app/app_state.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../presentation/form_wrapper.dart';
import '../../../forms/name_form.dart';

class SubscriptionFormName extends StatelessWidget {
  static int step = 4;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SubscriptionFormNameVM>(
      distinct: true,
      converter: (Store<AppState> store) => SubscriptionFormNameVM.fromStore(store),
      builder: (BuildContext context, SubscriptionFormNameVM viewModel) {
        return FormWrapper(child: NameForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class SubscriptionFormNameVM extends NameFormVM {
  SubscriptionFormNameVM({Function nextStep, Function previousStep, Function exit, Function onChanged, dynamic form})
      : super(nextStep: nextStep, previousStep: previousStep, exit: exit, onChanged: onChanged, form: form);

  static SubscriptionFormNameVM fromStore(Store<AppState> store) {
    return SubscriptionFormNameVM(
        nextStep: () => store.dispatch(SubscriptionFormNextStep()),
        previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
        exit: () => store.dispatch(SubscriptionFormExit()),
        onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)),
        form: store.state.subscriptionFormState.subscriptionForm);
  }
}
