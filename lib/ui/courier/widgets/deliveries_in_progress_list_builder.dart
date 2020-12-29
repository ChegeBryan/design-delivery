import 'package:design_delivery/ui/courier/views/in_progress_delivery_dialog_screen.dart';
import 'package:design_delivery/ui/courier/widgets/detail_attribute.dart';
import 'package:flutter/material.dart';

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
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (BuildContext context, int) => SizedBox(
        height: 150.0,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {
            _launchInProgressDeliveryDialog(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DetailAttribute(
                detailFor: 'Vendor Address',
                detailText: 'Address goes here',
              ),
              DetailAttribute(
                detailFor: 'Deliver to',
                detailText: 'Address Goes here',
              ),
              DetailAttribute(
                detailFor: 'Product Name',
                detailText: 'Name Goes here',
              ),
              DetailAttribute(
                detailFor: 'Quantity',
                detailText: 'Value',
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
