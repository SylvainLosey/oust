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
  double _value = 1.0;
  
  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Abonnement',
        subtitle: 'A quelle fréquence souhaite-tu que l\'on passe chez toi ?'
      ),
      form: BaseCard(
        child: Column(
          children: <Widget>[
            Text(
              _getName(),
              style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              _getPrice()
            ),
            Container(height: Layout.of(context).gridUnit(15)),
            FractionallySizedBox(
              widthFactor: 0.85,
              child: Column(
                children: <Widget>[
                  Slider(
                    onChanged: _setValue,
                    onChangeEnd: _saveToRedux,
                    value: _getValue(),
                    min: 0.0,
                    max: 2.0,
                    divisions: 2,
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.82,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        if (widget.viewModel.frequency == 4)
                          Text('1', style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w600))
                        else
                          Text('1'),
                          
                        if (widget.viewModel.frequency == 2)
                          Text('2', style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w600))
                        else
                          Text('2'),

                        if (widget.viewModel.frequency == 1)
                          Text('4', style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w600))
                        else
                          Text('4'),
                      ],
                    ),
                   ),
                ],
              ),
            ),
            Container(height: Layout.of(context).gridUnit(1)),
            Text('passages par mois')
          ],
        )
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: widget.viewModel.nextStep
      )
    );
  }

  String _getName() {
    switch(widget.viewModel.frequency) {
      case 4: return 'Abonnement Basique';
      case 2: return 'Abonnement Standard';
      case 1: return 'Abonnement Premium';
    }
  }

  String _getPrice() {
    switch(widget.viewModel.frequency) {
      case 4: return '20.- /mois';
      case 2: return '35.- /mois';
      case 1: return '55.- /mois';
    }
  }
  
  void _setValue(double value) => setState(() => _value = value);

  void _saveToRedux(double value) {
    if (value == 0.0) {
      widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..frequency = 4));
    }

    if (value == 1.0) {
      widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..frequency = 2));
    }

    if (value == 2.0) {
      widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..frequency = 1));
    }
  }

  double _getValue() {
    switch(widget.viewModel.frequency) {
      case 4: return 0.0;
      case 2: return 1.0;
      case 1: return 2.0;
      default: return 1.0;
    }
  }
}


class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final int frequency;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;


  _ViewModel({
    this.subscriptionForm,
    this.frequency,
    this.nextStep,
    this.previousStep,
    this.exit,
    this.onChanged
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      frequency: store.state.subscriptionFormState.subscriptionForm.frequency,
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm))
    );
  }
}