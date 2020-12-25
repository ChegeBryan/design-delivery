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
    );
  }
}
