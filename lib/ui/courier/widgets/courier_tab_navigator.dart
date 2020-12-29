import 'package:design_delivery/ui/courier/views/completed_deliveries_screen.dart';
import 'package:design_delivery/ui/courier/views/courier_profile_screen.dart';
import 'package:design_delivery/ui/courier/views/in_progress_deliveries_screen.dart';
import 'package:design_delivery/ui/courier/views/new_deliveries_screen.dart';
import 'package:flutter/material.dart';

class CourierTabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  CourierTabNavigator({this.navigatorKey, this.tabItem});

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (tabItem) {
      case 'new_deliveries':
        page = NewDeliveriesScreen();
        break;
      case 'in_progress':
        page = InProgressDeliveriesScreen();
        break;
      case 'delivered':
        page = CompletedDeliveriesScreen();
        break;
      case 'profile':
        page = CourierProfileScreen();
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
