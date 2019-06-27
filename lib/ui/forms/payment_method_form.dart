import 'package:flutter/material.dart';

import '../presentation/layout/title_form_button_layout.dart';
import '../presentation/title_widget.dart';
import '../presentation/selectable.dart';

class PaymentMethodForm extends StatelessWidget {
  final PaymentMethodVM viewModel;
  final List<Map<String, String>> paymentMethods;

  PaymentMethodForm(this.viewModel, this.paymentMethods);

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
        title: TitleWidget(title: 'Méthode de paiement', subtitle: 'Comment souhaites-tu payer ton abonnement?'),
        form: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(paymentMethods.length, (int index) {
              final Map<String, String> currentPaymentMethod = paymentMethods[index];
              return SelectableItem(
                onTap: () => _onTap(paymentMethod: currentPaymentMethod['paymentMethod']),
                title: currentPaymentMethod['title'],
                text: currentPaymentMethod['text'],
                selected: viewModel.paymentMethod == currentPaymentMethod['paymentMethod'],
              );
            })),
        button: RaisedButton(
            child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
            onPressed: viewModel.paymentMethod != null ? () => viewModel.nextStep() : null));
  }

  void _onTap({String paymentMethod}) {
    if (paymentMethod != viewModel.paymentMethod) {
      viewModel.onChanged(viewModel.form.rebuild((b) => b..paymentMethod = paymentMethod));
    } else {
      viewModel.onChanged(viewModel.form.rebuild((b) => b..paymentMethod = null));
    }
  }
}

abstract class PaymentMethodVM {
  final dynamic form;
  final String paymentMethod;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;

  PaymentMethodVM(
      {@required this.form,
      @required this.paymentMethod,
      @required this.nextStep,
      @required this.previousStep,
      @required this.exit,
      @required this.onChanged});
}
