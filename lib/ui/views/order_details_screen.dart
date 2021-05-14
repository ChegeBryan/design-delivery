import 'package:design_delivery/ui/widgets/order_details.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailsScreen({Key key, this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: OrderDetails(orderId: orderId),
    );
  }
}
