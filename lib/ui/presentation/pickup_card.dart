import 'package:flutter/material.dart';

import '../presentation/base_card.dart';
import '../../utils/layout.dart';
import '../../utils/colors.dart';
import '../../utils/datetime.dart';

class PickupCard extends StatelessWidget {
  final DateTime date;
  final String hour;

  PickupCard({this.date, this.hour});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(1)),
        child:  Column(
          children: <Widget>[
            Container(height: Layout.of(context).gridUnit(1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Container(height: Layout.of(context).gridUnit(2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {},
                  highlightedBorderColor: primaryColor,
                  child: Text(
                    'Repousser',
                    style: TextStyle(color: primaryColor),
                  )
                ),
                OutlineButton(
                  onPressed: () {},
                  highlightedBorderColor: primaryColor,
                  child: Text(
                    'Annuler',
                    style: TextStyle(color: primaryColor),
                  )
                ),
                OutlineButton(
                  onPressed: () {},
                  highlightedBorderColor: primaryColor,
                  child: Text(
                    'Remarque',
                    style: TextStyle(color: primaryColor),
                  )
                ),
              ],
            ),
            // Container(height: Layout.of(context).gridUnit(1)),
          ],
        )
      )
      
      
    );
  }
}