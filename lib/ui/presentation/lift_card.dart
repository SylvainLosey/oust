import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../utils/layout.dart';
import '../presentation/base_card.dart';
import '../presentation/lift_status.dart';
import '../../data/models/lift.dart';
import '../../data/models/lift_image.dart';

class LiftCard extends StatelessWidget {
  final Lift lift;
  final LiftImage image;
  final Function onPressed;

  LiftCard({this.lift, this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Layout.of(context).gridUnit(2)),
      child: BaseCard(
        onTap: onPressed,
        padding: false,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width / 3.7,
                  height: 100,
                  child: CachedNetworkImage(
                    imageUrl: image.url,
                    placeholder: (context, url) => Container(decoration: BoxDecoration(color: Colors.grey[200])),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(Layout.of(context).gridUnit(2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(lift.created),
                          style: Theme.of(context).textTheme.title.copyWith(color: Colors.grey[800])),
                      Container(height: Layout.of(context).gridUnit(0.5)),
                      LiftStatus(status: lift.status),
                      Container(height: Layout.of(context).gridUnit(3)),
                      Text(lift.address, style: Theme.of(context).textTheme.body1.copyWith(color: Colors.grey[600])),
                      // Text('Etage: Rez', style: Theme.of(context).textTheme.body1.copyWith(color: Colors.grey[600])),
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
      ),
    );
  }
}
