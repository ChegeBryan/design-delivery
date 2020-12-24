import 'package:design_delivery/ui/widgets/product_grid_builder.dart';
import 'package:flutter/material.dart';

class ProductsByCateory extends StatefulWidget {
  @override
  _ProductsByCateoryState createState() => _ProductsByCateoryState();
}

class _ProductsByCateoryState extends State<ProductsByCateory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Name'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ProductGridBuilder(),
    );
  }
}
