import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../redux/auth/auth_actions.dart';
import '../../redux/app/app_state.dart';


class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Key _formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(height: 100),
            _showEmailInput(),
            _showPasswordInput(),
            _showErrorMessage(),
            _showPrimaryButton(),
          ],
        ),
      )
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
        ),
        validator: (String value) => value.isEmpty ? 'Email can\'t be empty' : null,
        controller: _emailController
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Password',
        ),
        validator: (String value) => value.isEmpty ? 'Password can\'t be empty' : null,
        controller: _passwordController,
      ),
    );
  }

  Widget _showPrimaryButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: StoreConnector<AppState, OnLoginCallback>(
        converter: (Store<AppState> store) {
         return (String email, String password) {
           store.dispatch(UserLoginRequest(
             email: email,
             password: password,
           ));
         };
        },
        builder: (BuildContext context, OnLoginCallback onLogin) {
          return RaisedButton(
            child: Text(
              'Login',
              style: TextStyle(color:Colors.white),
            ),
            onPressed: () {
              onLogin(_emailController.text, _passwordController.text);
            },
          );
        }
      ) 
    );
  }

  Widget _showErrorMessage() {
    return StoreConnector<AppState, String>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.authState.error,
      builder: (BuildContext context, String error) {
        if (error != null) {
          return Text(
            error,
            style: TextStyle(
                fontSize: 13.0,
                color: Colors.red,
                height: 1.0,
                fontWeight: FontWeight.w300),
          );
        } else {
          return Container();
        }
      }
    );
  }
}

typedef OnLoginCallback = Function(String email, String password);