import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../presentation/base_card.dart';
import '../presentation/buttons.dart';
import '../../utils/layout.dart';
import '../../utils/colors.dart';
import '../../utils/datetime.dart';

class PickupCard extends StatelessWidget {
  final DateTime date;

  PickupCard({this.date});

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
                  _getWeekday(context, date),
                  style: Theme.of(context).textTheme.body2
                ),
                Text(
                  DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(date),
                  style: Theme.of(context).textTheme.body1
                ),
              ],
            ),
            Container(height: Layout.of(context).gridUnit(3)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    _asyncConfirmDialog(context);
                  },
                  child: Text(
                    'Repousser',
                    style: TextStyle(color: primaryColor),
                  )
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Annuler',
                    style: TextStyle(color: primaryColor),
                  )
                ),
                OutlinedButton(
                  onPressed: () {},
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

 
Future<String> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Repousser la passage ?'),
        content: Text(
            'Le passage sera repousse au _. Les passages suivants restent inchanges'),
        actions: <Widget>[
          FlatButton(
            child: Text('ANNULER'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('CONFIRMER'),
            onPressed: () {
              // Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}

  String _getWeekday(BuildContext context, DateTime date) {
    final int deltaDays = daysDelta(date, DateTime.now());
    final int deltaWeeks = weeksDelta(date, DateTime.now());

    final String weekday = capitalize(DateFormat.EEEE(Localizations.localeOf(context).toString()).format(date));

    if (deltaDays < 0) {
        return weekday;
    } else if (deltaDays == 0) {
        return 'Aujourd\'hui';
    } else if (deltaDays == 1) {
        return 'Demain';
    } else if (deltaWeeks == 0) {
      return '$weekday, cette semaine';
    } else if (deltaWeeks == 1) {
      return '$weekday, dans 1 semaine';
    } else if (deltaWeeks <= 4) {
      return '$weekday, dans $deltaWeeks semaines';
    } else {
      return weekday;
    }
  }
}


