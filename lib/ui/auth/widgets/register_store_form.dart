import 'package:design_delivery/helpers/email_validator.dart';
import 'package:design_delivery/ui/auth/widgets/auth_text_field.dart';
import 'package:design_delivery/ui/auth/widgets/submit_auth_form_button.dart';
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
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.amber,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Store name',
                      prefixIcon: Icon(Icons.store_outlined),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter store name';
                      }
                      return null;
                    },
                  ),
                  Divider(),
                  TextFormField(
                    cursorColor: Colors.amber,
                    keyboardType: TextInputType.streetAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Store Address',
                      prefixIcon: Icon(Icons.local_convenience_store_outlined),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter store name';
                      }
                      return null;
                    },
                  ),
                  Divider(),
                  TextFormField(
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
                  AuthTextField(
                    label: 'Password',
                    prefixIcon: Icons.lock_outlined,
                    obscureText: true,
                  ),
                  Divider(),
                  AuthTextField(
                    label: 'Confirm Password',
                    prefixIcon: Icons.lock_outlined,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            SubmitAuthFormButton(
              buttonLabel: 'Sign Up',
              action: () {},
            ),
          ],
        ),
      ),
    );
  }
}
