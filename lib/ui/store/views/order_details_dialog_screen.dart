import 'package:flutter/material.dart';

class OrderDetailDialogScreen extends StatefulWidget {
  @override
  _OrderDetailDialogScreenState createState() =>
      _OrderDetailDialogScreenState();
}

class _OrderDetailDialogScreenState extends State<OrderDetailDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detials'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Product Name'),
            subtitle: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            ),
          ),
        ],
      ),
    );
  }
}
