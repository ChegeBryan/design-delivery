import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/ui/views/order_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: Provider.of<Authentication>(context)
            .fetchUserData(Provider.of<Authentication>(context).getUid),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
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
                              snapshot.data.data()['username'],
                              style: TextStyle(
                                color: Color(0xFF25408F),
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(snapshot.data.data()['email']),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.list),
                        title: Text('My Orders'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderListScreen(),
                          ),
                        ),
                      ),
                      Divider(
                        indent: 52.0,
                      ),
                      ListTile(
                        leading: Icon(Icons.pin_drop),
                        title: Text('Manage Addresses'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                      Divider(
                        indent: 52.0,
                      ),
                      ListTile(
                        leading: Icon(Icons.money),
                        title: Text('Manage Mpesa Accounts'),
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
                        onTap: () {
                          Provider.of<Authentication>(context, listen: false)
                              .signOut();
                        },
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
        });
  }
}
