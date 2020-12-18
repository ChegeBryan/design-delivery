import 'package:flutter/material.dart';

import 'ui/views/home.dart';

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
      ),
      home: HomePage(),
    );
  }
}
