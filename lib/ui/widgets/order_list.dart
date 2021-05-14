import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/ui/common/detail_attribute.dart';
import 'package:design_delivery/ui/views/order_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderList extends StatelessWidget {
  void _launchOrderDetailsDialog(context, String orderId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => OrderDetailsScreen(orderId: orderId),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<OrderProvider>(context)
          .getUserOrders(Provider.of<Authentication>(context).getUid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) => SizedBox(
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  _launchOrderDetailsDialog(context, snapshot.data[index].id);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DetailAttribute(
                      detailFor: 'Order Id',
                      detailText: snapshot.data[index].id,
                    ),
                    DetailAttribute(
                      detailFor: 'Products',
                      detailText: snapshot.data[index]
                          .data()['products']
                          .keys
                          .length
                          .toString(),
                    ),
                    DetailAttribute(
                      detailFor: 'Delivery Address',
                      detailText:
                          snapshot.data[index].data()['deliveryAddress'],
                    ),
                  ],
                ),
              ),
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
  }
}
