import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../data/models/subscription_form.dart';
import '../../../../redux/app/app_state.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../presentation/form_wrapper.dart';
import '../../../forms/account_form.dart';

class SubscriptionFormAccount extends StatelessWidget {
  static int step = 14;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SubscriptionFormAccountVM>(
      distinct: true,
      converter: (Store<AppState> store) => SubscriptionFormAccountVM.fromStore(store),
      builder: (BuildContext context, SubscriptionFormAccountVM viewModel) {
        return FormWrapper(
            child: AccountForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class SubscriptionFormAccountVM extends AccountVM {
  SubscriptionFormAccountVM({dynamic form, Function previousStep, Function exit, Function onChanged, Function submit})
      : super(form: form, previousStep: previousStep, exit: exit, onChanged: onChanged, submit: submit);

  static SubscriptionFormAccountVM fromStore(Store<AppState> store) {
    return SubscriptionFormAccountVM(
        form: store.state.subscriptionFormState.subscriptionForm,
        previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
        exit: () => store.dispatch(SubscriptionFormExit()),
        onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)),
        submit: () {
          store.dispatch(SubmitSubscriptionFormRequest());
          store.dispatch(SubscriptionFormNextStep());
        });
  }
}
