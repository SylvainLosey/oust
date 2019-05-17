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
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        if (widget != null)
          Expanded(
            flex: 10,
            child: widget,
          ),
        title,
        Spacer(flex: 14),
        button,
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      ],
    );
  }
}
