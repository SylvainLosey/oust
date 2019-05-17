import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../redux/app/app_state.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../../utils/layout.dart';
import '../../../presentation/layout/title_form_button_layout.dart';
import '../../../presentation/main_app_bar.dart';
import '../../../presentation/title_widget.dart';
import '../../../presentation/product_card.dart';
import '../../../presentation/form_wrapper.dart';

class SubscriptionFormContainers extends StatelessWidget {
  static int step = 8;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return FormWrapper(
            child: WhatContainers(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class WhatContainers extends StatelessWidget {
  final _ViewModel viewModel;

  WhatContainers(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
        title:
            TitleWidget(title: 'Conteneurs', subtitle: 'La combinaison idéale dépend de ta consommation personelle.'),
        form: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          ProductCard(
            image: 'assets/images/container37l.png',
            title: 'Caisse 35 litres',
            subtitle: '15.00 CHF',
            quantity: viewModel.smallContainerQuantity.toString(),
            increment: () => viewModel.decrement(product: 'smallContainer'),
            decrement: () => viewModel.increment(product: 'smallContainer'),
          ),
          Container(height: Layout.of(context).gridUnit(2)),
          ProductCard(
            image: 'assets/images/container60l.png',
            title: 'Caisse 60 litres',
            subtitle: '20.00 CHF',
            quantity: viewModel.bigContainerQuantity.toString(),
            increment: () => viewModel.decrement(product: 'bigContainer'),
            decrement: () => viewModel.increment(product: 'bigContainer'),
          ),
          Container(height: Layout.of(context).gridUnit(4)),
          Container(
              padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total', style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w600)),
                  Text(_getTotal(), style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w600))
                ],
              ))
        ]),
        button: RaisedButton(
            child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
            onPressed: viewModel.nextStep));
  }

  String _getTotal() {
    final int total = viewModel.smallContainerQuantity * 15 + viewModel.bigContainerQuantity * 20;
    return '$total.00 CHF';
  }
}

class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function increment;
  final Function decrement;
  final int smallContainerQuantity;
  final int bigContainerQuantity;

  _ViewModel(
      {this.subscriptionForm,
      this.nextStep,
      this.previousStep,
      this.exit,
      this.increment,
      this.decrement,
      this.smallContainerQuantity,
      this.bigContainerQuantity});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      increment: ({String product}) => store.dispatch(IncrementProductQuantity(product: product)),
      decrement: ({String product}) => store.dispatch(DecrementProductQuantity(product: product)),
      smallContainerQuantity: store.state.subscriptionFormState.subscriptionForm.smallContainerQuantity,
      bigContainerQuantity: store.state.subscriptionFormState.subscriptionForm.bigContainerQuantity,
    );
  }
}
