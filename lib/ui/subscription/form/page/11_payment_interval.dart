import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';

import '../../../../redux/app/app_state.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../data/models/package.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../../utils/layout.dart';
import '../../../presentation/layout/title_form_button_layout.dart';
import '../../../presentation/main_app_bar.dart';
import '../../../presentation/title_widget.dart';
import '../../../presentation/selectable.dart';
import '../../../presentation/base_card.dart';


class SubscriptionFormPaymentInterval extends StatelessWidget {
  static int step = 13;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return WillPopScope(
          onWillPop: () async {
            viewModel.previousStep();
            return false;
          },
          child: Scaffold(
            appBar: MainAppBar(onExit: viewModel.exit),
            body: PaymentIntervalForm(viewModel),
          )
        );
      },
    );
  }
}


class PaymentIntervalForm extends StatefulWidget {
  final _ViewModel viewModel;

 PaymentIntervalForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => PaymentIntervalFormState();
}

class PaymentIntervalFormState extends State<PaymentIntervalForm> {
  List<Package> packages;

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Intervalle de paiement',
        subtitle: 'A quelles intervalles souhaites-tu recevoir une facture ?'
      ),
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(packages.length, (int index) {
            bool selected = widget.viewModel.selectedPackage == packages[index].id;
            return SelectableItem(
              onTap: () => _onTap(selectedPackage: packages[index].id),
              title: 'Tous les ${packages[index].length}',
              text: '${packages[index].pickups.toString()} passages',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CardText(
                    title: 'Tous les ${packages[index].length}',
                    text: '${packages[index].pickups.toString()} passages',
                    color: selected ?? false ? Colors.white : null
                  ),
                  if (selected)
                    Text('${packages[index].unitPrice} CHF', style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white))
                  else
                    Text('${packages[index].unitPrice} CHF', style: Theme.of(context).textTheme.subtitle)
                ],
              ),
              selected: selected,
            );
          }
        )
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: widget.viewModel.selectedPackage != null ? () => widget.viewModel.nextStep() : null
      )
    );
  }

  void _onTap({int selectedPackage}) {
    if (selectedPackage != widget.viewModel.selectedPackage) {
      widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..selectedPackage = selectedPackage));
    } else {
      widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..selectedPackage = null));
    }
  }

  @override
  void initState() {
    packages = widget.viewModel.packages.values.toList();
    packages.removeWhere((Package package) => !package.basePackage || package.frequencyWeeks != widget.viewModel.subscriptionForm.frequency);
    super.initState();
  }
}


class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final BuiltMap<int, Package> packages;
  final int selectedPackage;
  final String paymentMethod;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;

  _ViewModel({
    this.subscriptionForm,
    this.packages,
    this.selectedPackage,
    this.paymentMethod,
    this.nextStep,
    this.previousStep,
    this.exit,
    this.onChanged
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      packages: store.state.dataState.packages,
      selectedPackage: store.state.subscriptionFormState.subscriptionForm.selectedPackage,
      paymentMethod: store.state.subscriptionFormState.subscriptionForm.paymentMethod,
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)),
      exit: () => store.dispatch(SubscriptionFormExit()),
    );
  }
}