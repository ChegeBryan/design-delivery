import 'package:design_delivery/ui/widgets/product_store_grid_builder.dart';
import 'package:flutter/material.dart';

class ProductsByStoreScreen extends StatefulWidget {
  final String storeId;
  final String storeName;

  const ProductsByStoreScreen({Key key, this.storeId, this.storeName})
      : super(key: key);

  @override
  _ProductsByStoreScreenState createState() => _ProductsByStoreScreenState();
}

class _ProductsByStoreScreenState extends State<ProductsByStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.storeName),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ProductStoreGridBuilder(store: widget.storeId),
    );
  }
}
