import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/ui/auth/views/store_register_screen.dart';
import 'package:design_delivery/ui/auth/widgets/cover_image.dart';
import 'package:design_delivery/ui/auth/widgets/form_bottom_text.dart';
import 'package:design_delivery/ui/auth/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Authentication>(
      create: (_) => Authentication(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CoverImage(),
                  RegisterForm(),
                  FormBottomText(
                    message: 'Are you a vendor? Swipe right',
                    actionMessage: 'Create a vendor account',
                    swipeTo: StoreRegisterScreen(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
