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
          Divider(
            indent: 72,
          ),
          OrderDetail(
            leadingIcon: Icons.money_outlined,
            sectionTitle: 'Price',
            description: 'Ksh. 499',
          ),
          Divider(
            indent: 72,
          ),
          OrderDetail(
            leadingIcon: Icons.local_mall_outlined,
            sectionTitle: 'Quantity',
            description: '4 Pieces',
          ),
          Divider(
            indent: 72,
          ),
          OrderDetail(
            leadingIcon: Icons.place_outlined,
            sectionTitle: 'Delivery Address',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          ),
          Divider(
            indent: 72,
          ),
          OrderDetail(
            leadingIcon: Icons.schedule_outlined,
            sectionTitle: 'Order Time',
            description: '8.00 Am',
          ),
          Divider(
            indent: 72,
          ),
          OrderDetail(
            leadingIcon: Icons.person_outlined,
            sectionTitle: 'Customer Name',
            description: 'John Doe',
          ),
          SizedBox(height: 24.0),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.check_box_outlined,
              size: 18,
              color: Colors.white,
            ),
            label: Text(
              'Complete Order',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(StadiumBorder()),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 16.0)),
            ),
          )
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
