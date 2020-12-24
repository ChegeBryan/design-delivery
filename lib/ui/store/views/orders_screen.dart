import 'package:design_delivery/ui/store/views/order_details_dialog_screen.dart';
import "package:flutter/material.dart";

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // opens order dialog screen
  void _openOrderDetailsDialog() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => OrderDetailDialogScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (BuildContext context, int) => ListTile(
          title: Text('Product Name'),
          subtitle: Text('Address'),
          trailing: Text('Qty: 34'),
          isThreeLine: true,
          onTap: _openOrderDetailsDialog,
        ),
        separatorBuilder: (context, index) => Divider(),
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }
}
