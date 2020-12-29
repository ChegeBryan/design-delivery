import 'package:design_delivery/ui/courier/widgets/completed_deliveries_list_builder.dart';
import 'package:flutter/material.dart';

class CompletedDeliveriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Deliveries'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: CompletedDeliveriesListBuilder(),
    );
  }
}
