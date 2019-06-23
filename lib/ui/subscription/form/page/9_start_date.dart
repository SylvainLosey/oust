import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';

import '../../../../redux/app/app_state.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../presentation/form_wrapper.dart';
import '../../../../ui/forms/date_picker.dart';

class SubscriptionFormStartDate extends StatelessWidget {
  static int step = 11;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SubscriptionFormStartDateVM>(
        distinct: true,
        converter: (Store<AppState> store) => SubscriptionFormStartDateVM.fromStore(store),
        builder: (BuildContext context, SubscriptionFormStartDateVM viewModel) {
          return FormWrapper(
              child: DatePickerForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
        });
  }
}

class SubscriptionFormStartDateVM extends DatePickerVM {
  SubscriptionFormStartDateVM(
      {SubscriptionForm form,
      BuiltList<DateTime> startDates,
      DateTime selectedStartDate,
      Function nextStep,
      Function previousStep,
      Function exit,
      Function onChanged})
      : super(
            form: form,
            startDates: startDates,
            selectedStartDate: selectedStartDate,
            nextStep: nextStep,
            previousStep: previousStep,
            exit: exit,
            onChanged: onChanged);

  static SubscriptionFormStartDateVM fromStore(Store<AppState> store) => SubscriptionFormStartDateVM(
      form: store.state.subscriptionFormState.subscriptionForm,
      startDates: store.state.subscriptionFormState.subscriptionForm.startDates,
      selectedStartDate: store.state.subscriptionFormState.subscriptionForm.selectedStartDate,
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)));
}
