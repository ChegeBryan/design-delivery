import 'package:flutter/material.dart';

class RegisterStoreForm extends StatefulWidget {
  @override
  _RegisterStoreFormState createState() => _RegisterStoreFormState();
}

class _RegisterStoreFormState extends State<RegisterStoreForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Text('Form goes here'),
    );
  }
}
