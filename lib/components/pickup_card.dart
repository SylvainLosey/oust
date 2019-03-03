import 'package:flutter/material.dart';

import '../components/base_card.dart';
import '../presentation/layout.dart';
import '../services/utils.dart';

class PickupCard extends StatelessWidget {
  final DateTime date;
  final String hour;

  PickupCard({this.date, this.hour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: LayoutContainer.of(context).matGridUnit(scale: 3)),
      child: BaseCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              dateToStringFrench(date),
              style: Theme.of(context).textTheme.body2
            ),
            Text(
              hour,
            ),
          ],
        ),
      )
    );
  }
}