import 'package:flutter/material.dart';

import '../components/base_card.dart';
import '../services/utils.dart';

class PickupCard extends StatelessWidget {
  final DateTime date;
  final String hour;

  PickupCard({this.date, this.hour});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              dateToStringFrench(date),
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
            Text(
              hour,
            ),
          ],
        ),
    );
  }
}