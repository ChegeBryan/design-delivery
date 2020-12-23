import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            cursorColor: Colors.amber,
            keyboardType: TextInputType.text,
            autocorrect: false,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline),
              labelText: 'Username',
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(0, 8, 8, 8),
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
          Divider(),
          TextFormField(
            cursorColor: Colors.amber,
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
            cursorColor: Colors.amber,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outlined),
              border: InputBorder.none,
              labelText: 'Password',
              contentPadding: EdgeInsets.fromLTRB(0, 8, 8, 8),
            ),
            obscureText: true,
            textAlignVertical: TextAlignVertical.center,
          ),
          Divider(),
          TextFormField(
            cursorColor: Colors.amber,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outlined),
              border: InputBorder.none,
              labelText: 'Confirm Password',
              contentPadding: EdgeInsets.fromLTRB(0, 8, 8, 8),
            ),
            obscureText: true,
            textAlignVertical: TextAlignVertical.center,
          ),
        ],
      ),
    );
  }
}
