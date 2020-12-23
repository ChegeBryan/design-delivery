import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                ),
                Divider(),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outlined),
                    border: InputBorder.none,
                    labelText: 'Password',
                    contentPadding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                  ),
                  obscureText: true,
                  textAlignVertical: TextAlignVertical.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
