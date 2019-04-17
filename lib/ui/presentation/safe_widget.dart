import 'package:flutter/material.dart';

import '../../utils/layout.dart';

class SafePadding extends StatelessWidget {
  final Widget child;

  SafePadding({@required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(5)),
        child: child,
      )
    );
  }
}



class SafeColumn extends StatelessWidget {
  final List<Widget> children;

  SafeColumn({@required this.children});

  @override
  Widget build(BuildContext context) {
    return SafePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      )
    );
  }
}