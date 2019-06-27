import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../../redux/app/app_state.dart';
import '../../../../../data/models/lift_book_form.dart';
import '../../../../../redux/lift/forms/book/lift_book_form_actions.dart';
import '../../../../forms/payment_method_form.dart';
import '../../../../presentation/form_wrapper.dart';

class LiftBookFormPaymentMethod extends StatelessWidget {
  static int step = 3;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LiftBookFormPaymentMethodVM>(
      distinct: true,
      converter: (Store<AppState> store) => LiftBookFormPaymentMethodVM.fromStore(store),
      builder: (BuildContext context, LiftBookFormPaymentMethodVM viewModel) {
        final List<Map<String, String>> paymentMethods = [
          {'paymentMethod': 'onSite', 'title': 'Sur place', 'text': 'En espèce ou par carte lors de notre passage'},
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

class LiftBookFormPaymentMethodVM extends PaymentMethodVM {
  LiftBookFormPaymentMethodVM(
      {dynamic form, String paymentMethod, Function nextStep, Function previousStep, Function exit, Function onChanged})
      : super(
            form: form,
            paymentMethod: paymentMethod,
            nextStep: nextStep,
            previousStep: previousStep,
            exit: exit,
            onChanged: onChanged);

  static LiftBookFormPaymentMethodVM fromStore(Store<AppState> store) {
    return LiftBookFormPaymentMethodVM(
        form: store.state.liftBookFormState.liftBookForm,
        paymentMethod: store.state.liftBookFormState.liftBookForm.paymentMethod,
        nextStep: () {
          store.dispatch(SubmitLiftBookFormRequest());
          store.dispatch(LiftBookFormNextStep());
        },
        previousStep: () => store.dispatch(LiftBookFormPreviousStep()),
        exit: () => store.dispatch(LiftBookFormExit()),
        onChanged: (LiftBookForm form) => store.dispatch(UpdateLiftBookForm(form)));
  }
}
