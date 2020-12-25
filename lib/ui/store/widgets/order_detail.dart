import 'package:flutter/material.dart';

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
