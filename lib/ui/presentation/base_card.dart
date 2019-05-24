import 'package:flutter/material.dart';

import '../../utils/layout.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function onTap;
  final bool padding;

  BaseCard({this.child, this.color, this.onTap, this.padding = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: color,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ? EdgeInsets.all(Layout.of(context).gridUnit(2)) : EdgeInsets.all(0),
          child: child,
        ),
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
        Text(title, style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w500, color: color)),
        Text(text, style: Theme.of(context).textTheme.body1.copyWith(color: color))
      ],
    );
  }
}
