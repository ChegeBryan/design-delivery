import 'package:design_delivery/ui/courier/widgets/deliveries_in_progress_list_builder.dart';
import 'package:flutter/material.dart';

class InProgressDeliveriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliveries In Progress'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: DeliveriesInProgressListBuilder(),
    );
  }
}
