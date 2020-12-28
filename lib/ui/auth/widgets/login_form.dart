import 'package:design_delivery/ui/auth/widgets/auth_text_field.dart';
import 'package:design_delivery/ui/auth/widgets/submit_auth_form_button.dart';
import 'package:design_delivery/ui/store/views/app_store.dart';
import 'package:design_delivery/ui/views/app.dart';
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
                AuthTextField(
                  label: 'Email',
                  prefixIcon: Icons.email_outlined,
                  keyboard: TextInputType.emailAddress,
                ),
                Divider(),
                AuthTextField(
                  label: 'Password',
                  prefixIcon: Icons.lock_outlined,
                  obscureText: true,
                ),
              ],
            ),
          ),
          SubmitAuthFormButton(
            buttonLabel: 'Sign In',
            action: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => AppStore(),
                ),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
