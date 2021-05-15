import 'package:design_delivery/ui/store/widgets/completed_orders_list_builder.dart';
import 'package:flutter/material.dart';

class CompletedOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Orders'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: CompletedOrdersListBuilder(),
    );
  }
}
