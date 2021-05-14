import 'dart:async';

import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/services/product.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<OrderProvider>(context)
          .getUserOrders(Provider.of<Authentication>(context).getUid),
      builder: (context, ordersSnapshot) {
        print(ordersSnapshot.data[0].data()['products'].keys);
        if (ordersSnapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: ordersSnapshot.data.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return FutureBuilder(
                future: Provider.of<ManageProducts>(context)
                    .fetchProductsInArray(ordersSnapshot.data[index]
                        .data()['products']
                        .keys
                        .toList()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(snapshot.data[index].data()['productName']),
                        subtitle: Text('Address'),
                        trailing: Text(
                            'Qty. ${ordersSnapshot.data[index].data()['products'].values}'),
                        isThreeLine: true,
                        onTap: () {},
                      ),
                      separatorBuilder: (context, index) => Divider(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
            padding: const EdgeInsets.all(16.0),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
