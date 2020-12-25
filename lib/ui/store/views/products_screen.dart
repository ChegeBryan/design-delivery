import 'package:design_delivery/ui/store/views/add_product_dialog_screen.dart';
import 'package:design_delivery/ui/store/widgets/product_list_builder.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // opens product adding screen as fullscreen dialog
  void _lauchAddProductDialog() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AddProductDialogScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actionsIconTheme: IconThemeData(color: Color(0xFF25408F)),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: _lauchAddProductDialog)
        ],
      ),
      body: ProductListBuilder(),
    );
  }
}
