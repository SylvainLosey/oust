import 'package:flutter/material.dart';

import '../../utils/layout.dart';

class BaseCard extends StatelessWidget {
  final Widget child;

  BaseCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.symmetric(vertical: 12.0),
      // elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: EdgeInsets.all(LayoutContainer.of(context).matGridUnit(scale: 2)),
        child: child,
      ),
    );
  }
}