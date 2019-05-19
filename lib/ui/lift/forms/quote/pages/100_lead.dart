import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../../data/models/postcode.dart';
import '../../../../../data/models/lift_quote_form.dart';
import '../../../../../redux/app/app_state.dart';
import '../../../../../redux/lift/forms/quote/lift_quote_form_actions.dart';
import '../../../../presentation/form_wrapper.dart';
import '../../../../forms/lead_form.dart';

class LiftQuoteFormLead extends StatelessWidget {
  static int step = 100;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LiftQuoteFormLeadVM>(
      distinct: true,
      converter: (Store<AppState> store) => LiftQuoteFormLeadVM.fromStore(store),
      builder: (BuildContext context, LiftQuoteFormLeadVM viewModel) {
        return FormWrapper(child: LeadForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class LiftQuoteFormLeadVM extends LeadVM {
  LiftQuoteFormLeadVM(
      {Function previousStep,
      Function exit,
      Function onChanged,
      Function postLeadRequest,
      BuiltMap<int, Postcode> postcodes,
      dynamic form,
      bool isLoading,
      String error})
      : super(
            previousStep: previousStep,
            exit: exit,
            onChanged: onChanged,
            postLeadRequest: postLeadRequest,
            postcodes: postcodes,
            form: form,
            isLoading: isLoading,
            error: error);

  static LiftQuoteFormLeadVM fromStore(Store<AppState> store) {
    return LiftQuoteFormLeadVM(
      form: store.state.liftState.liftQuoteFormState.liftQuoteForm,
      isLoading: store.state.liftState.liftQuoteFormState.isLoading,
      error: store.state.liftState.liftQuoteFormState.error,
      postLeadRequest: (LiftQuoteForm form) => store.dispatch(PostLiftLeadRequest(form)),
      previousStep: () => store.dispatch(LiftQuoteFormPreviousStep()),
      exit: () => store.dispatch(LiftQuoteFormExit()),
      onChanged: (LiftQuoteForm form) => store.dispatch(UpdateLiftQuoteForm(form)),
      postcodes: store.state.dataState.postcodes,
    );
  }
}
