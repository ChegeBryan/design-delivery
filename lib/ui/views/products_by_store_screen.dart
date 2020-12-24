import 'package:design_delivery/ui/widgets/product_grid_builder.dart';
import 'package:flutter/material.dart';

class ProductsByStoreScreen extends StatefulWidget {
  @override
  _ProductsByStoreScreenState createState() => _ProductsByStoreScreenState();
}

class _ProductsByStoreScreenState extends State<ProductsByStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store name'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ProductGridBuilder(),
    );
  }
}
