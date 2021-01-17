import 'package:design_delivery/ui/widgets/all_products_grid.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatefulWidget {
  @override
  _AllProductsScreenState createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: AllProductsGrid(),
    );
  }
}
