import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../presentation/safe_widget.dart';
import '../../utils/layout.dart';
import '../../utils/localizations.dart';
import '../../redux/app/app_state.dart';
import '../../redux/subscription/form/subscription_form_actions.dart';
import '../../data/models/subscription_form.dart';


class SubscriptionEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return SafeColumn(
          children: <Widget>[
            Container(height: Layout.of(context).gridUnit(50)),
            Text(
              AppLocalizations.of(context).subscriptionHomeTitle, 
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
            Container(height: Layout.of(context).gridUnit(1)),
            Text(
              AppLocalizations.of(context).subscriptionHomeDescription, 
              style: Theme.of(context).textTheme.body1,
              textAlign: TextAlign.center,
            ),
            Container(height: Layout.of(context).gridUnit(15)),
            SizedBox(
              width: 250,
              child: RaisedButton(
                onPressed: viewModel.start,
                child: _getButtonText(viewModel)
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('J\'ai déjà un abonnement')
            )
          ]
        );
      },
    );
  }

  Text _getButtonText(_ViewModel viewModel) {
    if (viewModel.subscriptionForm.currentStep > 0) {
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

  _ViewModel({
    this.subscriptionForm,
    this.start
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      start: () => store.dispatch(SubscriptionFormStart())
     );
  }
}


