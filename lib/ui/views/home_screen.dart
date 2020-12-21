import 'package:design_delivery/ui/widgets/home_carousel.dart';
import 'package:design_delivery/ui/widgets/home_categories.dart';
import 'package:design_delivery/ui/widgets/home_recently_added.dart';
import 'package:design_delivery/ui/widgets/home_stores_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          HomeCarousel(),
          // category container
          HomeCategories(),
          SizedBox(height: 8.0),
          // Stores container
          HomeStoresContainer(),
          SizedBox(
            height: 8.0,
          ),
          HomeRecentlyAdded(),
        ],
      ),
    );
  }
}
