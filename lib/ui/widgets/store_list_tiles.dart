import 'package:design_delivery/services/stores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreListTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Stores>(context).fetchStores(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('No stores registered yet.'),
            );
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
