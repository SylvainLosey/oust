import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../../data/models/lift_quote_form.dart';
import '../../../../../redux/app/app_state.dart';
import '../../../../../redux/lift/forms/quote/lift_quote_form_actions.dart';
import '../../../../presentation/form_wrapper.dart';
import '../../../../forms/name_form.dart';

class LiftQuoteFormName extends StatelessWidget {
  static int step = 3;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LiftQuoteFormNameVM>(
      distinct: true,
      converter: (Store<AppState> store) => LiftQuoteFormNameVM.fromStore(store),
      builder: (BuildContext context, LiftQuoteFormNameVM viewModel) {
        return FormWrapper(child: NameForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class LiftQuoteFormNameVM extends NameFormVM {
  LiftQuoteFormNameVM({Function nextStep, Function previousStep, Function exit, Function onChanged, dynamic form})
      : super(nextStep: nextStep, previousStep: previousStep, exit: exit, onChanged: onChanged, form: form);

  static LiftQuoteFormNameVM fromStore(Store<AppState> store) {
    return LiftQuoteFormNameVM(
        nextStep: () => store.dispatch(LiftQuoteFormNextStep(isAuthenticated: store.state.authState.isAuthenticated)),
        previousStep: () =>
            store.dispatch(LiftQuoteFormPreviousStep(isAuthenticated: store.state.authState.isAuthenticated)),
        exit: () => store.dispatch(LiftQuoteFormExit()),
        onChanged: (LiftQuoteForm liftQuoteForm) => store.dispatch(UpdateLiftQuoteForm(liftQuoteForm)),
        form: store.state.liftQuoteFormState.liftQuoteForm);
  }
}
