import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../utils/layout.dart';
import '../../redux/app/app_state.dart';
import '../../redux/subscription/register/subscription_register_state.dart';
import '../../data/models/subscription_register.dart';


class SubscriptionEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(height: Layout.of(context).gridUnit(50)),
        Text('Abonnement', style: Theme.of(context).textTheme.title),
        Container(height: Layout.of(context).gridUnit(1)),
        Text(
          'Gagne 1 jour entier par année en nous laissant aller à la déchetterie pour toi!', 
          style: Theme.of(context).textTheme.body1,
          textAlign: TextAlign.center,
        ),
        Container(height: Layout.of(context).gridUnit(15)),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/subscription/register/');
          },
          child: Text('Découvrir', style: TextStyle(color: Colors.white))
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
}

@immutable
class _ViewModel {
  final SubscriptionRegister subscriptionRegister;

  _ViewModel({
    this.subscriptionRegister,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionRegister: store.state.subscriptionRegisterState.subscriptionRegister,
     );
  }
}


