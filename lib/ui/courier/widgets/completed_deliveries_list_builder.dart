import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/ui/courier/widgets/detail_attribute.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CompletedDeliveriesListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<OrderProvider>(context).getCourierCompletedDeliveries(
          Provider.of<Authentication>(context).getUid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Order no longer available'),
            );
          }
          return ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) => SizedBox(
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
                    detailFor: 'Deliver to',
                    detailText: snapshot.data[index].data()['deliveryAddress'],
                  ),
                  DetailAttribute(
                    detailFor: 'Customer',
                    detailText: snapshot.data[index].data()['customerName'],
                  ),
                  DetailAttribute(
                    detailFor: 'Pick Time',
                    detailText: DateFormat.yMMMd()
                        .add_jm()
                        .format(snapshot.data[index]
                            .data()['deliveryStartTime']
                            .toDate())
                        .toString(),
                  ),
                  DetailAttribute(
                    detailFor: 'Completed Time',
                    detailText: DateFormat.yMMMd()
                        .add_jm()
                        .format(snapshot.data[index]
                            .data()['deliveryEndTime']
                            .toDate())
                        .toString(),
                  ),
                ],
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
