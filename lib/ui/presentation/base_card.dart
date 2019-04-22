import 'package:flutter/material.dart';

import '../../utils/layout.dart';
import '../../utils/colors.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final Color color;

  BaseCard({this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.symmetric(vertical: 12.0),
      // elevation: 2.0,
      color: color,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: EdgeInsets.all(Layout.of(context).gridUnit(2)),
        child: child,
      ),
    );
  }
}


class CardText extends StatelessWidget {
  final String title;
  final String text;
  final Color color;

  CardText({this.title, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title, 
          style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w500, color: color)
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.body1.copyWith(color: color)
        )
      ],
    );
  }
}