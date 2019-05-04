import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../redux/app/app_state.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../utils/colors.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../../utils/layout.dart';
import '../../../presentation/layout/title_form_button_layout.dart';
import '../../../presentation/main_app_bar.dart';
import '../../../presentation/title_widget.dart';
import '../../../presentation/base_card.dart';


class SubscriptionFormFrequency extends StatelessWidget {
  static int step = 3;

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
            body: FrequencyForm(viewModel),
          )
        );
      },
    );
  }
}



class FrequencyForm extends StatefulWidget {
  final _ViewModel viewModel;

  FrequencyForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => FrequencyFormState();
}

class FrequencyFormState extends State<FrequencyForm> {

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Abonnement',
        subtitle: 'A quelle fréquence souhaite-tu que l\'on passe chez toi ?'
      ),
      form: Text('Hello'),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: widget.viewModel.nextStep
      )
    );
  }
}


class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final Function nextStep;
  final Function previousStep;
  final Function exit;

  _ViewModel({
    this.subscriptionForm,
    this.nextStep,
    this.previousStep,
    this.exit,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
    );
  }
}