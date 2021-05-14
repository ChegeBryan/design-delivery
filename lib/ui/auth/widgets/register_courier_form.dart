import 'package:design_delivery/helpers/email_validator.dart';
import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/ui/auth/views/auth_page_views.dart';

import 'package:design_delivery/ui/auth/widgets/submit_auth_form_button.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterCourierForm extends StatefulWidget {
  @override
  _RegisterCourierFormState createState() => _RegisterCourierFormState();
}

class _RegisterCourierFormState extends State<RegisterCourierForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _courierName = TextEditingController();
  final TextEditingController _courierEmail = TextEditingController();
  final TextEditingController _courierPhone = TextEditingController();
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
                  controller: _courierName,
                  cursorColor: Colors.amber,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Courier Name',
                    prefixIcon: Icon(Icons.person_outlined),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter courier name';
                    }
                    return null;
                  },
                ),
                Divider(),
                TextFormField(
                  controller: _courierEmail,
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
                  controller: _courierPhone,
                  cursorColor: Colors.amber,
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter phone number';
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
              Provider.of<Authentication>(context, listen: false)
                  .registerCourier(
                    courierName: _courierName.text,
                    courierPhone: _courierPhone.text,
                    courierEmail: _courierEmail.text,
                    password: _password.text,
                  )
                  .then((value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => AuthPageView()),
                      ));
            },
          ),
        ],
      ),
    );
  }
}
