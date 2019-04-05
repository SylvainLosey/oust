import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  final Widget child;

  Layout({this.child});

  @override
  State<StatefulWidget> createState() => LayoutState();

  static LayoutState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer) as _InheritedStateContainer).data;
  }
}

class LayoutState extends State<Layout> {
  // Add all your theme properties and logic here:
  double get spacingUnit => 10.0;
  static const double _gridUnit = 8.0;


  double gridUnit(double scale) {
    // Material design grid uses multiples of 8
    // Multiples of 4 are acceptable if needed
    // Only accept numbers that are full or half units of _gridUnit
    assert(scale % .5 == 0);
    return _gridUnit * scale;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final LayoutState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
