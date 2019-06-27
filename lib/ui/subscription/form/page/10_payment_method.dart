import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../redux/app/app_state.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../forms/payment_method_form.dart';
import '../../../presentation/form_wrapper.dart';

class SubscriptionFormPaymentMethod extends StatelessWidget {
  static int step = 12;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SubscriptionFormPaymentMethodVM>(
      distinct: true,
      converter: (Store<AppState> store) => SubscriptionFormPaymentMethodVM.fromStore(store),
      builder: (BuildContext context, SubscriptionFormPaymentMethodVM viewModel) {
        final List<Map<String, String>> paymentMethods = [
          {'paymentMethod': 'emailInvoice', 'title': 'Facture email', 'text': 'Sans frais et pratique'},
          {'paymentMethod': 'paperInvoice', 'title': 'Facture papier', 'text': '2.00 CHF par facture'},
        ];
        return FormWrapper(
            child: PaymentMethodForm(viewModel, paymentMethods),
            onExit: viewModel.exit,
            onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class SubscriptionFormPaymentMethodVM extends PaymentMethodVM {
  SubscriptionFormPaymentMethodVM(
      {dynamic form, String paymentMethod, Function nextStep, Function previousStep, Function exit, Function onChanged})
      : super(
            form: form,
            paymentMethod: paymentMethod,
            nextStep: nextStep,
            previousStep: previousStep,
            exit: exit,
            onChanged: onChanged);

  static SubscriptionFormPaymentMethodVM fromStore(Store<AppState> store) {
    return SubscriptionFormPaymentMethodVM(
        form: store.state.subscriptionFormState.subscriptionForm,
        paymentMethod: store.state.subscriptionFormState.subscriptionForm.paymentMethod,
        nextStep: () => store.dispatch(SubscriptionFormNextStep()),
        previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
        exit: () => store.dispatch(SubscriptionFormExit()),
        onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)));
  }
}
