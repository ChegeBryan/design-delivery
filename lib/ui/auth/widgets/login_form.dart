import 'package:design_delivery/ui/auth/widgets/auth_text_field.dart';
import 'package:design_delivery/ui/auth/widgets/submit_auth_form_button.dart';
import 'package:design_delivery/ui/courier/views/app_courier.dart';
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

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                  controller: _email,
                  cursorColor: Colors.amber,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                  ),
                  textAlignVertical: TextAlignVertical.center,
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
                    contentPadding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                  ),
                  obscureText: true,
                  textAlignVertical: TextAlignVertical.center,
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
                  builder: (context) => AppCourier(),
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
