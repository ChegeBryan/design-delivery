import 'package:design_delivery/ui/store/widgets/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailDialogScreen extends StatelessWidget {
  final Map<String, dynamic> orderSnapshot;
  final snapshot;

  const OrderDetailDialogScreen({Key key, this.orderSnapshot, this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          OrderDetail(
            leadingIcon: Icons.notes,
            sectionTitle: 'Product Name',
            description: snapshot.data()['productName'],
          ),
          Divider(
            indent: 72,
          ),
          OrderDetail(
            leadingIcon: Icons.money_outlined,
            sectionTitle: 'Price',
            description: 'Ksh. ${snapshot.data()['price'].toString()}',
          ),
          Divider(
            indent: 72,
          ),
          OrderDetail(
            leadingIcon: Icons.local_mall_outlined,
            sectionTitle: 'Quantity',
            description: orderSnapshot['products'][snapshot.id].toString(),
          ),
          Divider(
            indent: 72,
          ),
          OrderDetail(
            leadingIcon: Icons.place_outlined,
            sectionTitle: 'Delivery Address',
            description: orderSnapshot['deliveryAddress'],
          ),
          Divider(
            indent: 72,
          ),
          OrderDetail(
            leadingIcon: Icons.schedule_outlined,
            sectionTitle: 'Order Time',
            description: DateFormat.yMMMd()
                .add_jm()
                .format(orderSnapshot['createdOn'].toDate())
                .toString(),
          ),
          Divider(
            indent: 72,
          ),
          OrderDetail(
            leadingIcon: Icons.person_outlined,
            sectionTitle: 'Customer Name',
            description: orderSnapshot['customerName'],
          ),
        ],
      ),
    );
  }
}
