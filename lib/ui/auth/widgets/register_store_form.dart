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
                  AuthTextField(
                    label: 'Store Address',
                    prefixIcon: Icons.local_convenience_store_outlined,
                    keyboard: TextInputType.streetAddress,
                  ),
                  Divider(),
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
