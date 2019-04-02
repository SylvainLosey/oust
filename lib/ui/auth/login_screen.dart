import 'package:flutter/material.dart';

import '../auth/auth_loading_indicator.dart';
import '../auth/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        LoginForm(),
        AuthLoadingIndicator(),
      ],
    );
  }
}