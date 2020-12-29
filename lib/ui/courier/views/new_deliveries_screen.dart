import 'package:design_delivery/ui/courier/widgets/new_deliveries_list_builder.dart';
import 'package:flutter/material.dart';

class NewDeliveriesScreen extends StatefulWidget {
  @override
  _NewDeliveriesScreenState createState() => _NewDeliveriesScreenState();
}

class _NewDeliveriesScreenState extends State<NewDeliveriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Deliveries'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: NewDeliveriesListBuilder(),
    );
  }
}
