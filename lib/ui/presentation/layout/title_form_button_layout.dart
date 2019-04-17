import 'package:flutter/material.dart';

import '../../../utils/layout.dart';
import '../safe_widget.dart';

class TitleFormButton extends StatelessWidget {
  final Widget title;
  final Widget form;
  final Widget button;

  TitleFormButton({this.title, this.form, this.button});

  @override
  Widget build(BuildContext context) {
    return SafeColumn(
      children: <Widget>[
        Container(height: Layout.of(context).gridUnit(3)),
        title,
        Container(height: Layout.of(context).gridUnit(7)),
        form,
        Spacer(),
        button,
        Container(height:Layout.of(context).gridUnit(1))
      ],
    );
  }
}