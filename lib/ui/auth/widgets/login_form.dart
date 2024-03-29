import 'package:design_delivery/helpers/email_validator.dart';
import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/ui/auth/widgets/auth_text_field.dart';
import 'package:design_delivery/ui/auth/widgets/submit_auth_form_button.dart';
import 'package:design_delivery/ui/courier/views/app_courier.dart';
import 'package:design_delivery/ui/store/views/app_store.dart';
import 'package:design_delivery/ui/views/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                    contentPadding: EdgeInsets.fromLTRB(48, 8, 8, 8),
                    //errorStyle: TextStyle(),
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
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          SubmitAuthFormButton(
            buttonLabel: 'Sign In',
            action: () {
              if (_formKey.currentState.validate()) {
                Provider.of<Authentication>(context, listen: false)
                    .loginUserAccount(_email.text, _password.text)
                    .then((value) {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(Provider.of<Authentication>(context, listen: false)
                          .getUid)
                      .get()
                      .then((DocumentSnapshot documentSnapshot) {
                    if (documentSnapshot.exists) {
                      Map<String, dynamic> data = documentSnapshot.data();
                      if (data['role'] == 'user') {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => App(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      } else if (data['role'] == 'store') {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppStore(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      } else if (data['role'] == 'courier') {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppCourier(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      }
                    } else {
                      print('Document does not exist on the database');
                    }
                  });
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
