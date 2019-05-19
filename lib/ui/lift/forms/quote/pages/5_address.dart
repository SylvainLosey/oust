import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../../data/models/postcode.dart';
import '../../../../../data/models/lift_quote_form.dart';
import '../../../../../redux/app/app_state.dart';
import '../../../../../redux/lift/forms/quote/lift_quote_form_actions.dart';
import '../../../../presentation/form_wrapper.dart';
import '../../../../forms/address_form.dart';

class LiftQuoteFormAddress extends StatelessWidget {
  static int step = 5;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LiftQuoteFormAddressVM>(
      distinct: true,
      converter: (Store<AppState> store) => LiftQuoteFormAddressVM.fromStore(store),
      builder: (BuildContext context, LiftQuoteFormAddressVM viewModel) {
        return FormWrapper(
            child: AddressForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class LiftQuoteFormAddressVM extends AddressFormVM {
  LiftQuoteFormAddressVM(
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

  static LiftQuoteFormAddressVM fromStore(Store<AppState> store) => LiftQuoteFormAddressVM(
      nextStep: (Postcode selectedPostcode) =>
          store.dispatch(LiftQuoteFormNextStep(subscriptionIsUnavailable: !selectedPostcode.subscriptionAvailable)),
      previousStep: () => store.dispatch(LiftQuoteFormPreviousStep()),
      exit: () => store.dispatch(LiftQuoteFormExit()),
      onChanged: (LiftQuoteForm liftQuoteForm) => store.dispatch(UpdateLiftQuoteForm(liftQuoteForm)),
      postcodes: store.state.dataState.postcodes,
      form: store.state.liftState.liftQuoteFormState.liftQuoteForm,
      selectedPostcode: store.state.liftState.liftQuoteFormState.liftQuoteForm.postcode);
}
