import 'package:design_delivery/ui/store/widgets/orders_list.dart';
import "package:flutter/material.dart";

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Orders'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: OrdersList());
  }
}
