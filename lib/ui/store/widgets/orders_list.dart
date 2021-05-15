import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/store/views/order_details_dialog_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersList extends StatelessWidget {
  // opens order dialog screen
  void _openOrderDetailsDialog(context, orderSnapshot, product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => OrderDetailDialogScreen(
            orderSnapshot: orderSnapshot, snapshot: product),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<OrderProvider>(context).getOrdersAwaitingDelivery(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('There\'s no pending orders.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> orderSnapshot = snapshot.data[index].data();
              return FutureBuilder(
                future: Provider.of<ManageProducts>(context)
                    .fetchProductsByStoreInArray(
                        Provider.of<Authentication>(context).getUid,
                        orderSnapshot['products'].keys.toList()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text('Product not found.'),
                      );
                    }
                    return ListView.separated(
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                        title: Text(snapshot.data[index].data()['productName']),
                        subtitle: Text(orderSnapshot['deliveryAddress']),
                        trailing: Text(
                            'Qty: ${orderSnapshot['products'][snapshot.data[index].id]}'),
                        isThreeLine: true,
                        onTap: () {
                          _openOrderDetailsDialog(
                            context,
                            orderSnapshot,
                            snapshot.data[index],
                          );
                        },
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      padding: const EdgeInsets.all(16.0),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
