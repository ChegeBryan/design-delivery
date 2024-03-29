import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/ui/auth/views/auth_page_views.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Authentication(),
      child: MaterialApp(
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
              color: Color(0xFF25408F),
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
      ),
    );
  }
}
