import 'package:flutter/material.dart';
import 'package:design_delivery/ui/views/cart_screen.dart';
import 'package:design_delivery/ui/views/home_screen.dart';
import 'package:design_delivery/ui/views/user_profile_screen.dart';
import 'package:design_delivery/ui/views/wishlist_screen.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  TabNavigator({this.navigatorKey, this.tabItem});

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (tabItem) {
      case 'home':
        page = HomeScreen();
        break;
      case 'wishlist':
        page = WishlistScreen();
        break;
      case 'cart':
        page = CartScreen();
        break;
      case 'profile':
        page = UserProfileScreen();
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
