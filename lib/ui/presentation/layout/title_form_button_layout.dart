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
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        title,
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        form,
        Spacer(),
        button,
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      ],
    );
  }
}
