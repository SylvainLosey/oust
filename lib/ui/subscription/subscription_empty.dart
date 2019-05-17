import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../data/models/subscription_form.dart';
import '../../redux/app/app_state.dart';
import '../../redux/subscription/form/subscription_form_actions.dart';
import '../presentation/layout/empty_home_layout.dart';
import '../presentation/title_widget.dart';

class SubscriptionEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return EmptyHomeLayout(
          title: TitleWidget(
              title: 'Abonnement', subtitle: 'Oust! collecte à ton domicile tous tes déchets pour la déchetterie'),
          button:
              RaisedButton(onPressed: viewModel.start, child: _getButtonText(viewModel.subscriptionForm.currentStep)),
          secondaryButton: FlatButton(onPressed: null, child: Text('J\'ai déjà un abonnement')),
        );
      },
    );
  }

  Text _getButtonText(int currentStep) {
    if (currentStep > 0) {
      return Text('Continuer l\'inscription', style: TextStyle(color: Colors.white));
    } else {
      return Text('Découvrir', style: TextStyle(color: Colors.white));
    }
  }
}

@immutable
class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final Function start;

  _ViewModel({this.subscriptionForm, this.start});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
        start: () => store.dispatch(SubscriptionFormStart()));
  }
}
