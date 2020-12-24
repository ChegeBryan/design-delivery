import 'package:design_delivery/ui/store/views/products_screen.dart';
import 'package:design_delivery/ui/store/views/store_profile.dart';
import 'package:flutter/material.dart';

class StoreTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  StoreTabNavigator({this.navigatorKey, this.tabItem});

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (tabItem) {
      case 'products':
        page = ProductsScreen();
        break;
      case 'profile':
        page = StoreProfile();
        break;
    }
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => page,
        );
      },
    );
  }
}
