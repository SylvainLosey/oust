import 'package:flutter/material.dart';

import '../safe_widget.dart';

class WidgetTitleButtonLayout extends StatelessWidget {
  final Widget widget;
  final Widget title;
  final Widget button;

  WidgetTitleButtonLayout({this.widget, this.title, this.button});

  @override
  Widget build(BuildContext context) {
    return SafeColumn(
       children: <Widget>[
        Spacer(flex: 1),
        Expanded(
          flex: 10,
          child: widget,
        ),
        Spacer(flex: 1),
        title,
        Spacer(flex: 14),
        button,
      ],
    );
  }
}