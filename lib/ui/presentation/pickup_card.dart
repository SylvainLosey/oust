import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../presentation/base_card.dart';
import '../presentation/buttons.dart';
import '../../utils/layout.dart';
import '../../utils/colors.dart';
import '../../utils/datetime.dart';
import '../../data/models/pickup.dart';

class PickupCard extends StatefulWidget {
  final Pickup pickup;
  final Function onPushBack;
  final Function onDelete;
  final Function onAddNote;
  final bool isExpandable;

  PickupCard(
      {this.pickup, this.onPushBack, this.onDelete, this.onAddNote, this.isExpandable = false});

  @override
  PickupCardState createState() => PickupCardState();
}

class PickupCardState extends State<PickupCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: widget.isExpandable
          ? () => setState(() {
                if (widget.isExpandable) {
                  isExpanded = !isExpanded;
                }
              })
          : null,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: Layout.of(context).gridUnit(1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_getWeekday(context, widget.pickup.pickupDate, widget.isExpandable),
                      style: Theme.of(context).textTheme.body2),
                  Spacer(flex: 20),
                  Text(
                      DateFormat.yMMMd(Localizations.localeOf(context).toString())
                          .format(widget.pickup.pickupDate),
                      style: Theme.of(context).textTheme.body1),
                  Spacer(flex: 1),
                  if (!isExpanded && widget.isExpandable)
                    Icon(Icons.expand_more, size: 14, color: Colors.grey[400]),
                  if (isExpanded && widget.isExpandable)
                    Icon(Icons.expand_less, size: 14, color: Colors.grey[400]),
                ],
              ),

              if (!widget.isExpandable)
                Container(height: Layout.of(context).gridUnit(2)),

              if (widget.pickup.customerNote != '')
                Text(widget.pickup.customerNote,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.body1.copyWith(
                          color: Colors.grey[700],
                        )),

              if (!widget.isExpandable || isExpanded)
                Container(height: Layout.of(context).gridUnit(2)),

              if (isExpanded || !widget.isExpandable)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    OutlinedButton(
                        onPressed: widget.onPushBack,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.redo, size: 14, color: primaryColor),
                            SizedBox(width: Layout.of(context).gridUnit(0.5)),
                            Text(
                              'Repousser',
                              style: TextStyle(color: primaryColor),
                            )
                          ],
                        )),
                    OutlinedButton(
                        onPressed: widget.onDelete,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.close, size: 14, color: primaryColor),
                            SizedBox(width: Layout.of(context).gridUnit(0.5)),
                            Text(
                              'Annuler',
                              style: TextStyle(color: primaryColor),
                            )
                          ],
                        )),
                    OutlinedButton(
                        onPressed: widget.onAddNote,
                        child: Row(
                          children: <Widget>[
                            Icon(widget.pickup.customerNote == '' ? Icons.add : Icons.edit,
                                size: 14, color: primaryColor),
                            SizedBox(width: Layout.of(context).gridUnit(0.5)),
                            Text(
                              'Remarque',
                              style: TextStyle(color: primaryColor),
                            )
                          ],
                        ))
                  ],
                ),
              // Container(height: Layout.of(context).gridUnit(1)),
            ],
          )),
    );
  }
}

String _getWeekday(BuildContext context, DateTime date, bool isExpandable) {
  final int deltaDays = daysDelta(date, DateTime.now());
  final int deltaWeeks = weeksDelta(date, DateTime.now());

  final String weekday =
      capitalize(DateFormat.EEEE(Localizations.localeOf(context).toString()).format(date));

  if (deltaDays < 0 || isExpandable) {
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
