import 'package:flutter/material.dart';


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
        boxShadow: [BoxShadow(spreadRadius: 3, blurRadius: 10, color: Colors.grey.withOpacity(0.4))]
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