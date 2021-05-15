import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/common/detail_attribute.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CompletedOrdersListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<OrderProvider>(context).getDeliveredOrders(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('No delivered orders available.'),
            );
          }

          return ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
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
                        child: Text('No products found.'),
                      );
                    }
                    return SizedBox(
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Order',
                                style: TextStyle(
                                  color: Color(0xFF25408F),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                snapshot.data[index].id,
                                style: TextStyle(
                                  color: Color(0xFF25408F),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          DetailAttribute(
                            detailFor: 'Delivered to',
                            detailText: orderSnapshot['deliveryAddress'],
                          ),
                          DetailAttribute(
                            detailFor: 'Customer',
                            detailText: orderSnapshot['customerName'],
                          ),
                          DetailAttribute(
                            detailFor: 'Pick Time',
                            detailText: DateFormat.yMMMd()
                                .add_jm()
                                .format(
                                    orderSnapshot['deliveryStartTime'].toDate())
                                .toString(),
                          ),
                          DetailAttribute(
                            detailFor: 'Completed Time',
                            detailText: DateFormat.yMMMd()
                                .add_jm()
                                .format(
                                    orderSnapshot['deliveryEndTime'].toDate())
                                .toString(),
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
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
