import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/ui/auth/views/register_screen.dart';
import 'package:design_delivery/ui/auth/widgets/cover_image.dart';
import 'package:design_delivery/ui/auth/widgets/form_bottom_text.dart';
import 'package:design_delivery/ui/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CoverImage(),
                LoginForm(),
                FormBottomText(
                  message: "Don't have an account? Swipe right",
                  actionMessage: 'Create a new account',
                  swipeTo: RegisterScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
