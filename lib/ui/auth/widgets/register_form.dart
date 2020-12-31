import 'package:design_delivery/ui/auth/widgets/auth_text_field.dart';
import 'package:design_delivery/ui/auth/widgets/submit_auth_form_button.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  AuthTextField(
                    label: 'Username',
                    prefixIcon: Icons.person_outline,
                    controller: _username,
                  ),
                  Divider(),
                  AuthTextField(
                    label: 'Email',
                    prefixIcon: Icons.email_outlined,
                    keyboard: TextInputType.emailAddress,
                    controller: _email,
                  ),
                  Divider(),
                  AuthTextField(
                    label: 'Password',
                    prefixIcon: Icons.lock_outlined,
                    obscureText: true,
                    controller: _password,
                  ),
                  Divider(),
                  AuthTextField(
                    label: 'Confirm Password',
                    prefixIcon: Icons.lock_outlined,
                    obscureText: true,
                    controller: _confirmPassword,
                  ),
                ],
              ),
            ),
            SubmitAuthFormButton(buttonLabel: 'Sign Up'),
          ],
        ),
      ),
    );
  }
}
