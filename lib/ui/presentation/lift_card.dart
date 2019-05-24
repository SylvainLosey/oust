import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/layout.dart';
import '../presentation/base_card.dart';
import '../../data/models/lift.dart';
import '../../data/models/lift_image.dart';

// WARNING: The layout IntrinsicHeight > Row > CrossAxisStretch > ContainerWIdth 100 > fit.cover should not be touched
class LiftCard extends StatelessWidget {
  final Lift lift;
  final LiftImage image;

  LiftCard({this.lift, this.image});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: false,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width / 3.7, child: Image.network(image.url, fit: BoxFit.cover)),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(Layout.of(context).gridUnit(2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(lift.created),
                        style: Theme.of(context).textTheme.title.copyWith(color: Colors.grey[800])),
                    Container(height: Layout.of(context).gridUnit(1)),
                    LiftStatus(status: 'En attente du prix'),
                    Spacer(),
                    Text(lift.address, style: Theme.of(context).textTheme.body1.copyWith(color: Colors.grey[600])),
                    Text('Etage: Rez', style: Theme.of(context).textTheme.body1.copyWith(color: Colors.grey[600])),
                  ],
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(Layout.of(context).gridUnit(1)),
                child: Icon(Icons.navigate_next, color: Colors.grey[800]))
          ],
        ),
      ),
    );
  }
}

class LiftStatus extends StatelessWidget {
  final String status;

  LiftStatus({this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(0.5), vertical: 2),
        decoration: BoxDecoration(color: Colors.red[300], borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Text(status, style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white)));
  }
}
