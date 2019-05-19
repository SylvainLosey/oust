import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../data/models/postcode.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../redux/app/app_state.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../presentation/form_wrapper.dart';
import '../../../forms/lead_form.dart';

class SubscriptionFormLead extends StatelessWidget {
  static int step = 100;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SubscriptionFormLeadVM>(
      distinct: true,
      converter: (Store<AppState> store) => SubscriptionFormLeadVM.fromStore(store),
      builder: (BuildContext context, SubscriptionFormLeadVM viewModel) {
        return FormWrapper(child: LeadForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class SubscriptionFormLeadVM extends LeadVM {
  SubscriptionFormLeadVM(
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

  static SubscriptionFormLeadVM fromStore(Store<AppState> store) {
    return SubscriptionFormLeadVM(
      form: store.state.subscriptionFormState.subscriptionForm,
      isLoading: store.state.subscriptionFormState.isLoading,
      error: store.state.subscriptionFormState.error,
      postLeadRequest: (SubscriptionForm subscriptionForm) {
        store.dispatch(PostSubscriptionLeadRequest(
            subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..leadStatus = 'postcode_not_covered')));
      },
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)),
      postcodes: store.state.dataState.postcodes,
    );
  }
}
