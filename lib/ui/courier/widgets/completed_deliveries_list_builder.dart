import 'package:design_delivery/ui/courier/widgets/detail_attribute.dart';
import 'package:flutter/material.dart';

class CompletedDeliveriesListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (BuildContext context, int) => SizedBox(
        height: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery $int',
              style: TextStyle(
                color: Color(0xFF25408F),
                fontSize: 16.0,
                fontWeight: FontWeight.w900,
              ),
            ),
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
            DetailAttribute(
              detailFor: 'Pick Time',
              detailText: 'Value',
            ),
            DetailAttribute(
              detailFor: 'Completed Time',
              detailText: 'Value',
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => Divider(),
      padding: const EdgeInsets.all(16.0),
    );
  }
}
