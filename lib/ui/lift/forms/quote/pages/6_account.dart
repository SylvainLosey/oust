import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../../data/models/lift_quote_form.dart';
import '../../../../../redux/app/app_state.dart';
import '../../../../../redux/lift/forms/quote/lift_quote_form_actions.dart';
import '../../../../presentation/form_wrapper.dart';
import '../../../../forms/account_form.dart';

class LiftQuoteFormAccount extends StatelessWidget {
  static int step = 14;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LiftQuoteFormAccountVM>(
      distinct: true,
      converter: (Store<AppState> store) => LiftQuoteFormAccountVM.fromStore(store),
      builder: (BuildContext context, LiftQuoteFormAccountVM viewModel) {
        return FormWrapper(
            child: AccountForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class LiftQuoteFormAccountVM extends AccountVM {
  LiftQuoteFormAccountVM({dynamic form, Function previousStep, Function exit, Function onChanged, Function submit})
      : super(form: form, previousStep: previousStep, exit: exit, onChanged: onChanged, submit: submit);

  static LiftQuoteFormAccountVM fromStore(Store<AppState> store) {
    return LiftQuoteFormAccountVM(
        form: store.state.liftQuoteFormState.liftQuoteForm,
        previousStep: () => store.dispatch(LiftQuoteFormPreviousStep()),
        exit: () => store.dispatch(LiftQuoteFormExit()),
        onChanged: (LiftQuoteForm subscriptionForm) => store.dispatch(UpdateLiftQuoteForm(subscriptionForm)),
        submit: () {
          store.dispatch(SubmitLiftQuoteFormRequest());
          store.dispatch(LiftQuoteFormNextStep());
        });
  }
}
