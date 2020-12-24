import 'package:flutter/material.dart';

class OrderDetailDialogScreen extends StatefulWidget {
  @override
  _OrderDetailDialogScreenState createState() =>
      _OrderDetailDialogScreenState();
}

class _OrderDetailDialogScreenState extends State<OrderDetailDialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detials'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          OrderDetail(
            leadingIcon: Icons.notes,
            sectionTitle: 'Product Name',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          ),
        ],
      ),
    );
  }
}

class OrderDetail extends StatelessWidget {
  const OrderDetail({
    Key key,
    @required this.leadingIcon,
    @required this.sectionTitle,
    @required this.description,
  }) : super(key: key);

  final IconData leadingIcon;
  final String sectionTitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(
        sectionTitle,
        style: TextStyle(
          color: Color(0xFF515C6F),
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          color: Color(0xFF727C8E),
          fontSize: 16.0,
        ),
      ),
    );
  }
}
