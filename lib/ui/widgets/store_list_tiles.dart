import 'package:design_delivery/services/stores.dart';
import 'package:design_delivery/ui/views/products_by_store_screen.dart';
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
          return ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(snapshot.data[index].data()['storeName']),
              subtitle: Text(snapshot.data[index].data()['storeAddress']),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsByStoreScreen(
                    storeId: snapshot.data[index].id,
                    storeName: snapshot.data[index].data()['storeName'],
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => Divider(),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
