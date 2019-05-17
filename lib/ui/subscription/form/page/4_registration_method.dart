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
import '../../../presentation/form_wrapper.dart';

class SubscriptionFormRegistrationMethod extends StatelessWidget {
  static int step = 6;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return FormWrapper(
            child: RegistrationMethodForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class RegistrationMethodForm extends StatelessWidget {
  final _ViewModel viewModel;

  RegistrationMethodForm(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
        title: TitleWidget(title: 'Méthode d\'inscription', subtitle: 'Comment souhaites-tu créer ton abonnement?'),
        form: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SelectableItem(
                onTap: () => _onTap(method: 'app'),
                title: 'M\'inscrire tout de suite',
                text: 'Terminer l\'inscription depuis l\'application en quelques minutes.',
                selected: viewModel.registrationMethod == 'app'),
            Container(height: Layout.of(context).gridUnit(1)),
            SelectableItem(
                onTap: () => _onTap(method: 'rdv'),
                title: 'Fixer un rendez-vous',
                text: 'Convenir d\'un rendez-vous à ton domicile. Idéal si tu as des demandes spéciales.',
                selected: viewModel.registrationMethod == 'rdv'),
          ],
        ),
        button: RaisedButton(
            child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
            onPressed:
                viewModel.registrationMethod != null ? () => viewModel.nextStep(viewModel.registrationMethod) : null));
  }

  void _onTap({String method}) {
    if (method != viewModel.registrationMethod) {
      viewModel
          .onChanged(viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..registrationMethod = method));
    } else {
      viewModel
          .onChanged(viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..registrationMethod = null));
    }
  }
}

class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final String registrationMethod;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;

  _ViewModel(
      {this.subscriptionForm, this.registrationMethod, this.nextStep, this.previousStep, this.exit, this.onChanged});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
        registrationMethod: store.state.subscriptionFormState.subscriptionForm.registrationMethod,
        nextStep: (String selectedMethod) {
          if (selectedMethod == 'app') {
            store.dispatch(SubscriptionFormNextStep());
          } else if (selectedMethod == 'rdv') {
            store.dispatch(SubscriptionFormNextStep(customerRequestsAppointment: true));
          }

          // Dispatch action here a bit after the address if the user changes his mind
          store.dispatch(LoadStartDatesRequest(
            address: store.state.subscriptionFormState.subscriptionForm.address,
            postcode: store.state.subscriptionFormState.subscriptionForm.postcode,
            frequency: store.state.subscriptionFormState.subscriptionForm.frequency,
          ));
        },
        previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
        exit: () => store.dispatch(SubscriptionFormExit()),
        onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)));
  }
}
