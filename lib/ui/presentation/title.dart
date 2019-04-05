import 'package:flutter/material.dart';

import '../../utils/layout.dart';

class TextTitle extends StatelessWidget {
  final String text;

  TextTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Layout.of(context).gridUnit(4),
        bottom: Layout.of(context).gridUnit(1)
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subhead.copyWith(
          fontWeight: FontWeight.w500
        )
      )
    );
  }
}