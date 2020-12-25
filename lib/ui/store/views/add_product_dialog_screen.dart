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
      ),
    );
  }
}
