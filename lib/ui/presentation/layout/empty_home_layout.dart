import 'package:flutter/material.dart';

import '../safe_widget.dart';

class EmptyHomeLayout extends StatelessWidget {
  final Widget widget;
  final Widget title;
  final Widget button;
  final Widget secondaryButton;

  EmptyHomeLayout({this.widget, this.title, this.button, this.secondaryButton});

  @override
  Widget build(BuildContext context) {
    return SafeColumn(
      children: <Widget>[
        Container(height: MediaQuery.of(context).size.height * 0.1),
        title,
        Spacer(flex: 1),
        if (widget != null)
          Expanded(
            flex: 10,
            child: widget,
          ),
        Spacer(flex: 6),
        button,
        if (secondaryButton != null)
          secondaryButton,
        // 48 is the height of the secondary button, which we substract if it is present to align the primary button
        Container(height: MediaQuery.of(context).size.height * 0.1 - (secondaryButton == null ? 0 : 48)),
      ],
    );
  }
}
