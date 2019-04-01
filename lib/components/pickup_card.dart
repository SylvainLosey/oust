import 'package:flutter/material.dart';

import '../components/base_card.dart';
import '../presentation/layout.dart';
import '../utils/datetime_utils.dart';

class PickupCard extends StatelessWidget {
  final DateTime date;
  final String hour;

  PickupCard({this.date, this.hour});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Row(
        children: <Widget>[
          Expanded(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  dateToStringFrench(date),
                  style: Theme.of(context).textTheme.body2
                ),
                Text(
                  hour,
                  style: Theme.of(context).textTheme.body1
                ),
              ],
            ),
          ),

          RaisedButton(
            onPressed: () {},
            child: Text(
              'Modifier',
              style: TextStyle(color: Colors.white),
            )
          )
        ],
      )
    );
  }
}