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
import '../../../presentation/selectable.dart';


class SubscriptionFormPaymentMethod extends StatelessWidget {
  static int step = 12;

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
            body: PaymentMethodForm(viewModel),
          )
        );
      },
    );
  }
}


class PaymentMethodForm extends StatefulWidget {
  final _ViewModel viewModel;

 PaymentMethodForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => PaymentMethodFormState();
}

class PaymentMethodFormState extends State<PaymentMethodForm> {

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Méthode de paiement',
        subtitle: 'Comment souhaites-tu payer ton abonnement?'
      ),
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SelectableItem(
            onTap: () => _onTap(paymentMethod: 'emainInvoice'),
            title: 'Facture email',
            text: 'Sans frais et pratique',
            selected: widget.viewModel.paymentMethod == 'emainInvoice'
          ),
          Container(height: Layout.of(context).gridUnit(1)),
          SelectableItem(
            onTap: () => _onTap(paymentMethod: 'paperInvoice'),
            title: 'Facture papier',
            text: '2.00 CHF par facture',
            selected: widget.viewModel.paymentMethod == 'paperInvoice'
          ),
        ],
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: widget.viewModel.paymentMethod != null ? () => widget.viewModel.nextStep() : null
      )
    );
  }

  void _onTap({String paymentMethod}) {
    if (paymentMethod != widget.viewModel.paymentMethod) {
      widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..paymentMethod = paymentMethod));
    } else {
      widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..paymentMethod = null));
    }
  }
}


class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final String paymentMethod;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;

  _ViewModel({
    this.subscriptionForm,
    this.paymentMethod,
    this.nextStep,
    this.previousStep,
    this.exit,
    this.onChanged
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      paymentMethod: store.state.subscriptionFormState.subscriptionForm.paymentMethod,
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm))
    );
  }
}