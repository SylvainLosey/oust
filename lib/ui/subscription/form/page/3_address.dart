import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../data/models/postcode.dart';
import '../../../../data/models/customer.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../redux/app/app_state.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../presentation/form_wrapper.dart';
import '../../../forms/address_form.dart';

class SubscriptionFormAddress extends StatelessWidget {
  static int step = 5;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SubscriptionFormAddressVM>(
      distinct: true,
      converter: (Store<AppState> store) => SubscriptionFormAddressVM.fromStore(store),
      builder: (BuildContext context, SubscriptionFormAddressVM viewModel) {
        return FormWrapper(
            child: AddressForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class SubscriptionFormAddressVM extends AddressFormVM {
  SubscriptionFormAddressVM(
      {Function nextStep,
      Function previousStep,
      Function exit,
      Function onChanged,
      BuiltMap<int, Postcode> postcodes,
      dynamic form,
      int selectedPostcode})
      : super(
            nextStep: nextStep,
            previousStep: previousStep,
            exit: exit,
            onChanged: onChanged,
            postcodes: postcodes,
            form: form,
            selectedPostcode: selectedPostcode);

  static SubscriptionFormAddressVM fromStore(Store<AppState> store) => SubscriptionFormAddressVM(
        nextStep: (Postcode selectedPostcode) => store
            .dispatch(SubscriptionFormNextStep(subscriptionIsUnavailable: !selectedPostcode.subscriptionAvailable)),
        previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
        exit: () => store.dispatch(SubscriptionFormExit()),
        onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)),
        postcodes: store.state.dataState.postcodes,
        form: store.state.subscriptionFormState.subscriptionForm,
        selectedPostcode: store.state.subscriptionFormState.subscriptionForm.postcode,
      );
}
