import 'package:flutter/material.dart';

class InProgressDeliveriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliveries In Progress'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
