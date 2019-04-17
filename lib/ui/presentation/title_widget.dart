import 'package:flutter/material.dart';

import '../../utils/layout.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  TitleWidget({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title, 
          style: Theme.of(context).textTheme.title
        ),
        Container(height: Layout.of(context).gridUnit(0.5)),
        Text(
          subtitle, 
          style: Theme.of(context).textTheme.body1, 
          textAlign: TextAlign.center
        )
      ],
    );
  }
}