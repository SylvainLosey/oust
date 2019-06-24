import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oust/utils/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../data/repository.dart';
import '../../data/models/pickup.dart';
import '../../utils/datetime.dart';

Future<void> pushBackPickupDialog({BuildContext context, Function onPushBackPickup, Pickup pickup}) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return FutureBuilder(
          future: Repository().fetchPushBackDate(pickup.id),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final String date = weekdayAndDate(context, DateTime.parse(snapshot.data));
              return AlertDialog(
                title: Text('Repousser le passage ?'),
                content: Text('Le passage sera repoussé au $date. Les passages suivants restent inchangés'),
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
                      onPushBackPickup(pickup);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            } else {
              return AlertDialog(
                title: Text('Repousser le passage ?'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SpinKitThreeBounce(color: primaryColor, size: 24),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('ANNULER'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            }
          });
    },
  );
}

Future<void> deletePickupDialog({BuildContext context, Function onDeletePickup, Pickup pickup}) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        final String date = weekdayAndDate(context, pickup.pickupDate.toLocal());
        return AlertDialog(
          title: Text('Supprimer le passage ?'),
          content:
              Text('Le passage du $date sera supprimé, et un nouveau passage sera ajouté à la fin de votre abonnement'),
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
                onDeletePickup(pickup);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
