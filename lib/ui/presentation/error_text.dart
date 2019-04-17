import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String error;

  ErrorText({this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error, style: Theme.of(context).textTheme.body1.copyWith(color: Colors.red[300], fontWeight: FontWeight.w600)),
    );
  }
}
