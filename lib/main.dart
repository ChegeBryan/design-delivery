import 'package:design_delivery/ui/auth/views/auth_page_views.dart';
import 'package:flutter/material.dart';

import 'ui/auth/views/login_screen.dart';
import 'ui/views/app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Delivery Home',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(0xFF727C8E),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(
            color: Color(0xFF254081),
          ),
          unselectedIconTheme: IconThemeData(
            color: Color(0xFF727C8E),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // set Lato as default font
        fontFamily: 'Lato',
      ),
      home: AuthPageView(),
    );
  }
}
