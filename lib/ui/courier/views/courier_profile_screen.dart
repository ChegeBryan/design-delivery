import 'package:flutter/material.dart';

class CourierProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Courier Name',
                        style: TextStyle(
                          color: Color(0xFF25408F),
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('courier@email.ddress'),
                      Text('+2467383783'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.markunread_mailbox_outlined),
                  title: Text('New Delivery Requests'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider(
                  indent: 52.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
