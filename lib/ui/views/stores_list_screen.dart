import 'package:design_delivery/ui/widgets/store_list_tiles.dart';
import 'package:flutter/material.dart';

class StoresListScreen extends StatefulWidget {
  @override
  _StoresListScreenState createState() => _StoresListScreenState();
}

class _StoresListScreenState extends State<StoresListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stores'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: StoreListTiles(),
      ),
    );
  }
}
