import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/store/widgets/store_tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppStore extends StatefulWidget {
  @override
  _AppStoreState createState() => _AppStoreState();
}

class _AppStoreState extends State<AppStore> {
  int _currentTab = 0;
  String _currentPage = 'products';

  List<String> pageKeys = ['products', 'orders', 'profile'];

  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'products': GlobalKey<NavigatorState>(),
    'orders': GlobalKey<NavigatorState>(),
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
          // if not on the products page
          if (_currentPage != 'products') {
            // switch to products page
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
          ChangeNotifierProvider(create: (context) => ManageProducts()),
          ChangeNotifierProvider(create: (context) => OrderProvider()),
        ],
        child: Scaffold(
          body: Stack(children: <Widget>[
            _buildOffstageNavigator('products'),
            _buildOffstageNavigator('orders'),
            _buildOffstageNavigator('profile'),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                activeIcon: Icon(Icons.list),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.storefront_outlined),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_outlined,
                ),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            showUnselectedLabels: true,
            currentIndex: _currentTab,
            onTap: _onItemTapped,
            selectedLabelStyle: TextStyle(color: Color(0xFF25408F)),
          ),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: StoreTabNavigator(
        // keep each navigator key seprate for each tab
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
