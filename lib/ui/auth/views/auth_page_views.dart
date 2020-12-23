import 'package:design_delivery/ui/auth/views/login_screen.dart';
import 'package:design_delivery/ui/auth/views/register_screen.dart';
import 'package:flutter/material.dart';

class AuthPageView extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        LoginScreen(),
        RegisterScreen(),
      ],
    );
  }
}
