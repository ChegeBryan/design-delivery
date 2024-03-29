import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/courier/widgets/courier_tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppCourier extends StatefulWidget {
  @override
  _AppCourierState createState() => _AppCourierState();
}

class _AppCourierState extends State<AppCourier> {
  int _currentTab = 0;
  String _currentPage = 'new_deliveries';

  List<String> pageKeys = [
    'new_deliveries',
    'in_progress',
    'delivered',
    'profile'
  ];

  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'new_deliveries': GlobalKey<NavigatorState>(),
    'in_progress': GlobalKey<NavigatorState>(),
    'delivered': GlobalKey<NavigatorState>(),
    'profile': GlobalKey<NavigatorState>(),
  };

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = pageKeys[index];
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the home page
          if (_currentPage != 'new_deliveries') {
            // switch to home page
            _onItemTapped(0);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => OrderProvider()),
          ChangeNotifierProvider(create: (context) => ManageProducts()),
        ],
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              _buildOffstageNavigator('new_deliveries'),
              _buildOffstageNavigator('in_progress'),
              _buildOffstageNavigator('delivered'),
              _buildOffstageNavigator('profile'),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.markunread_mailbox_outlined),
                activeIcon: Icon(Icons.markunread_mailbox),
                label: 'New Deliveries',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.two_wheeler_outlined),
                activeIcon: Icon(Icons.two_wheeler),
                label: 'In progress',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.done_all_outlined),
                activeIcon: Icon(Icons.done_all),
                label: 'Delivered',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentTab,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: CourierTabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
