import 'package:design_delivery/services/stores.dart';
import 'package:design_delivery/ui/views/products_by_store_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeStoresContainer extends StatelessWidget {
  const HomeStoresContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Stores',
                  style: TextStyle(
                    color: Color(0xFF254081),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    fontFamily: 'Lato',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See More'),
                ),
              ],
            ),
          ),
          StoresList()
        ],
      ),
    );
  }
}

class StoresList extends StatelessWidget {
  const StoresList({
    Key key,
  }) : super(key: key);

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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: List.generate(
                snapshot.data.length,
                (index) => Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsByStoreScreen(
                          storeId: snapshot.data[index].id,
                          storeName: snapshot.data[index].data()['storeName'],
                        ),
                      ),
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 12),
                        child: Text(
                          snapshot.data[index].data()['storeName'],
                          style: TextStyle(
                            color: Color(0xFF727C8E),
                            fontSize: 16.0,
                            fontFamily: 'Lato',
                          ),
                          softWrap: false,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
