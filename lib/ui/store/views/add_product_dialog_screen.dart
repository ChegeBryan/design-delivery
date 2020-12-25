import 'package:design_delivery/ui/store/widgets/add_product_form.dart';
import 'package:flutter/material.dart';

class AddProductDialogScreen extends StatefulWidget {
  @override
  _AddProductDialogScreenState createState() => _AddProductDialogScreenState();
}

class _AddProductDialogScreenState extends State<AddProductDialogScreen> {
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
              'Save',
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: AddContactForm(),
      ),
    );
  }
}
