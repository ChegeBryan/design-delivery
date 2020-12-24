import 'package:design_delivery/ui/store/widgets/product_list_builder.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actionsIconTheme: IconThemeData(color: Color(0xFF25408F)),
        actions: [
          IconButton(icon: Icon(Icons.store), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: ProductListBuilder(),
    );
  }
}
