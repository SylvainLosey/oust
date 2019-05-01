import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../redux/app/app_state.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../presentation/layout/widget_title_button_layout.dart';
import '../../../presentation/main_app_bar.dart';
import '../../../presentation/title_widget.dart';


class SubscriptionFormHowItWorks extends StatelessWidget {
  static int step = 1;

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
            appBar: MainAppBar(),
            body: WidgetTitleButtonLayout(
              widget: Image.asset('assets/images/logo.png'),
              title: TitleWidget(
                title:'Fonctionnement',
                subtitle: 'Nous passons collecter à ton domicile tous tes déchets triés, à la fréquence qui te convient.',
              ),
              button: RaisedButton(
                child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
                onPressed: viewModel.nextStep
              ),
            )
          )
        );
      },
    );
  }
}


@immutable
class _ViewModel {
  final Function nextStep;
  final Function previousStep;

  _ViewModel({
    this.nextStep,
    this.previousStep,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep())
     );
  }
}