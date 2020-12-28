import 'package:design_delivery/ui/auth/widgets/auth_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterCourierForm extends StatefulWidget {
  @override
  _RegisterCourierFormState createState() => _RegisterCourierFormState();
}

class _RegisterCourierFormState extends State<RegisterCourierForm> {
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
                AuthTextField(
                  label: 'Courier Name',
                  prefixIcon: Icons.person_outlined,
                ),
                Divider(),
                AuthTextField(
                  label: 'Email',
                  prefixIcon: Icons.email_outlined,
                  keyboard: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
