import 'package:design_delivery/ui/views/all_products_screen.dart';
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(48),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(5.0, 5.0),
                blurRadius: 5.0,
                color: Colors.black87.withOpacity(0.05),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Products...',
              suffixIcon: Icon(Icons.search),
              border: InputBorder.none,
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 8.0),
          HomeCarousel(),
          // category container
          HomeCategories(),
          SizedBox(height: 8.0),
          // Stores container
          HomeStoresContainer(),
          SizedBox(
            height: 8.0,
          ),
          Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recently Added',
                        style: TextStyle(
                          color: Color(0xFF254081),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllProductsScreen(),
                          ),
                        ),
                        child: Text('Shop More'),
                      ),
                    ],
                  ),
                ),
                HomeRecentlyAdded(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
