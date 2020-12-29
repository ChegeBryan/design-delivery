import 'package:design_delivery/ui/courier/views/delivery_details_dialog_screen.dart';
import 'package:design_delivery/ui/courier/widgets/detail_attribute.dart';
import 'package:flutter/material.dart';

class NewDeliveriesListBuilder extends StatelessWidget {
  const NewDeliveriesListBuilder({
    Key key,
  }) : super(key: key);

  void _launchDeliveryDetailsDialog(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => DeliveryDetailsScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (BuildContext context, int) => SizedBox(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {
            _launchDeliveryDetailsDialog(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DetailAttribute(
                detailFor: 'Vendor Name',
                detailText: 'Address goes here',
              ),
              DetailAttribute(
                detailFor: 'Vendor Address',
                detailText: 'Address goes here',
              ),
              DetailAttribute(
                detailFor: 'Deliver to',
                detailText: 'Address Goes here',
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => Divider(),
      padding: const EdgeInsets.all(16.0),
    );
  }
}
