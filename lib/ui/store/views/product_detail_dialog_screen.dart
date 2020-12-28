import 'package:design_delivery/ui/store/widgets/view_product_detail.dart';
import 'package:flutter/material.dart';

class ProductDetailDialogScreen extends StatefulWidget {
  @override
  _ProductDetailDialogScreenState createState() =>
      _ProductDetailDialogScreenState();
}

class _ProductDetailDialogScreenState extends State<ProductDetailDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actionsIconTheme: IconThemeData(color: Color(0xFF25408F)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.delete))],
      ),
      body: ViewProductDetail(),
    );
  }
}
