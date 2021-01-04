import 'package:design_delivery/helpers/email_validator.dart';
import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/ui/auth/widgets/submit_auth_form_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: Column(
        children: [
          Card(
            child: Column(
              children: [
                TextFormField(
                  controller: _username,
                  cursorColor: Colors.amber,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person_outline),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),
                Divider(),
                TextFormField(
                  controller: _email,
                  cursorColor: Colors.amber,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter email';
                    } else if (!isEmail(value)) {
                      return 'Provide a valid email';
                    }
                    return null;
                  },
                ),
                Divider(),
                TextFormField(
                  controller: _password,
                  cursorColor: Colors.amber,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outlined),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                  ),
                  obscureText: true,
                  textAlignVertical: TextAlignVertical.center,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a password';
                    }
                    return null;
                  },
                ),
                Divider(),
                TextFormField(
                  controller: _confirmPassword,
                  cursorColor: Colors.amber,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock_outlined),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                  ),
                  obscureText: true,
                  textAlignVertical: TextAlignVertical.center,
                  validator: (value) {
                    if (value != _password.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          SubmitAuthFormButton(
            buttonLabel: 'Sign Up',
            action: () {
              if (_formKey.currentState.validate()) {
                Provider.of<Authentication>(context, listen: false)
                    .registerUserAccount(
                        _username.text, _email.text, _password.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
