import 'package:design_delivery/ui/store/widgets/edit_product_form.dart';
import 'package:flutter/material.dart';

class EditProductDialogScreen extends StatefulWidget {
  @override
  _EditProductDialogScreenState createState() =>
      _EditProductDialogScreenState();
}

class _EditProductDialogScreenState extends State<EditProductDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          TextButton(
            style: ButtonStyle(),
            onPressed: () {},
            child: Text(
              'Update',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: EditProductForm(),
        ),
      ),
    );
  }
}
