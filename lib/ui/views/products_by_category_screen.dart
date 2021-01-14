import 'package:design_delivery/ui/widgets/product_grid_builder.dart';
import 'package:flutter/material.dart';

class ProductsByCateory extends StatefulWidget {
  final String category;

  const ProductsByCateory({Key key, this.category}) : super(key: key);
  @override
  _ProductsByCateoryState createState() => _ProductsByCateoryState();
}

class _ProductsByCateoryState extends State<ProductsByCateory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ProductGridBuilder(category: widget.category),
    );
  }
}
