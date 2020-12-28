import 'package:design_delivery/ui/auth/widgets/auth_text_field.dart';
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
                  AuthTextField(
                    label: 'Store name',
                    prefixIcon: Icons.person_outline,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
