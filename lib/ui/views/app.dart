import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/widgets/user_tab_navigator_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentTab = 0;
  String _currentPage = 'home';

  List<String> pageKeys = ['home', 'wishlist', 'cart', 'profile'];

  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    'home': GlobalKey<NavigatorState>(),
    'wishlist': GlobalKey<NavigatorState>(),
    'cart': GlobalKey<NavigatorState>(),
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
          if (_currentPage != 'home') {
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
          ChangeNotifierProvider(create: (context) => ManageProducts()),
        ],
        child: Scaffold(
          body: Stack(children: <Widget>[
            _buildOffstageNavigator('home'),
            _buildOffstageNavigator('wishlist'),
            _buildOffstageNavigator('cart'),
            _buildOffstageNavigator('profile'),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                ),
                activeIcon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                activeIcon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline_outlined,
                ),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentTab,
            onTap: _onItemTapped,
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        // keep each navigator key seprate for each tab
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
