import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/ui/courier/views/delivery_details_dialog_screen.dart';
import 'package:design_delivery/ui/courier/widgets/detail_attribute.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewDeliveriesListBuilder extends StatelessWidget {
  const NewDeliveriesListBuilder({
    Key key,
  }) : super(key: key);

  void _launchDeliveryDetailsDialog(context, orderId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            DeliveryDetailsScreen(orderId: orderId),
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
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('No New Orders.'),
            );
          }
          return ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) => SizedBox(
              height: 75.0,
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                onTap: () {
                  _launchDeliveryDetailsDialog(
                      context, snapshot.data[index].id);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DetailAttribute(
                      detailFor: 'Customer Name',
                      detailText: snapshot.data[index].data()['customerName'],
                    ),
                    DetailAttribute(
                      detailFor: 'Deliver to',
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
