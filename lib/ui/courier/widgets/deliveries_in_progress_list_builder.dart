import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/ui/courier/views/in_progress_delivery_dialog_screen.dart';
import 'package:design_delivery/ui/courier/widgets/detail_attribute.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveriesInProgressListBuilder extends StatelessWidget {
  const DeliveriesInProgressListBuilder({
    Key key,
  }) : super(key: key);

  void _launchInProgressDeliveryDialog(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => InProgressDeliveryDialogScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<OrderProvider>(context)
            .getOrdersCourierInProgressDeliveries(
                Provider.of<Authentication>(context).getUid),
        builder: (context, snapshot) {
          return ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    _launchInProgressDeliveryDialog(context);
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
              );
            },
            separatorBuilder: (context, index) => Divider(),
            padding: const EdgeInsets.all(16.0),
          );
        });
  }
}
