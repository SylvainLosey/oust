import 'package:flutter/material.dart';

import '../presentation/layout.dart';

class TextTitle extends StatelessWidget {
  final String text;

  TextTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: LayoutContainer.of(context).matGridUnit()),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title
      )
    );
  }
}