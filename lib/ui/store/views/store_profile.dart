import 'package:flutter/material.dart';

class StoreProfile extends StatefulWidget {
  @override
  _StoreProfileState createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
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
                        'Store Name',
                        style: TextStyle(
                          color: Color(0xFF25408F),
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('store address'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text('All Products'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider(
                  indent: 52.0,
                ),
                ListTile(
                  leading: Icon(Icons.money),
                  title: Text('Pending Orders'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider(
                  indent: 52.0,
                ),
                ListTile(
                  leading: Icon(Icons.check_box_outlined),
                  title: Text('Completed Orders'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider(
                  indent: 52.0,
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider(
                  indent: 52.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Delete Account',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
