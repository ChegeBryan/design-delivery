import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/ui/store/views/order_details_dialog_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersList extends StatelessWidget {
  // opens order dialog screen
  void _openOrderDetailsDialog(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => OrderDetailDialogScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<OrderProvider>(context).getOrders(),
      builder: (context, snapshot) {
        return ListView.separated(
          itemCount: 20,
          itemBuilder: (BuildContext context, int) => ListTile(
            title: Text('Product Name'),
            subtitle: Text('Address'),
            trailing: Text('Qty: 34'),
            isThreeLine: true,
            onTap: () {
              _openOrderDetailsDialog(context);
            },
          ),
          separatorBuilder: (context, index) => Divider(),
          padding: const EdgeInsets.all(16.0),
        );
      },
    );
  }
}
