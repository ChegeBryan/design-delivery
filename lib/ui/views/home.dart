import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
              ),
              label: 'Profile',
            ),
          ],
          showSelectedLabels: false,
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
