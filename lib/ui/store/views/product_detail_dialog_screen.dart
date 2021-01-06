import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/store/views/edit_product_dialog_screen.dart';
import 'package:design_delivery/ui/store/widgets/view_product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailDialogScreen extends StatefulWidget {
  final String productId;

  const ProductDetailDialogScreen({Key key, @required this.productId})
      : super(key: key);

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
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ManageProducts>(context, listen: false)
                    .deleteProduct(widget.productId)
                    .then((value) => Navigator.of(context).pop());
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: ViewProductDetail(productId: widget.productId),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF25408F),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  EditProductDialogScreen(productId: widget.productId),
              fullscreenDialog: true,
            ),
          );
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
