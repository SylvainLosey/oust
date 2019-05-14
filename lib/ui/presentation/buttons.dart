import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  GradientButton({
    this.onPressed, 
    this.child
  });  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: <Color>[Color(0xFF23836D), Color(0xFF00B78E)]
        ),
        boxShadow: <BoxShadow>[BoxShadow(spreadRadius: 3, blurRadius: 10, color: Colors.grey.withOpacity(0.4))]
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: child,
              ),
            )
          ),
      ),
    );
  }
}

class OutlinedButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  OutlinedButton({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor, width: 0.8)
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: child
        )
      ),
    );
  }
}