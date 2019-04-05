import 'package:flutter/material.dart';

import '../../utils/layout.dart';

class SubscriptionEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Navigator.pushNamed(context, '/subscription/register');
          },
          child: Text('Découvrir', style: TextStyle(color: Colors.white))
        ),
        FlatButton(
          onPressed: () {},
          child: Text('J\'ai déjà un abonnement')
        )

      ]
    );
  }
}