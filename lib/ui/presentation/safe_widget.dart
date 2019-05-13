import 'package:flutter/material.dart';

import '../../utils/layout.dart';

class SafePadding extends StatelessWidget {
  final Widget child;

  SafePadding({@required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(3)),
        child: child,
      )
    );
  }
}



class SafeColumn extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final List<Widget> children;

  SafeColumn({
    @required this.children, 
    this.crossAxisAlignment = CrossAxisAlignment.stretch, 
    this.mainAxisAlignment = MainAxisAlignment.start
  });

  @override
  Widget build(BuildContext context) {
    return SafePadding(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: children,
      )
    );
  }
}