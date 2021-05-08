import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_delivery/main.dart';
import 'package:design_delivery/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreProfile extends StatefulWidget {
  @override
  _StoreProfileState createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: Provider.of<Authentication>(context)
          .fetchStoreData(Provider.of<Authentication>(context).getUid),
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
                            snapshot.data.data()['storeName'],
                            style: TextStyle(
                              color: Color(0xFF25408F),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(snapshot.data.data()['email']),
                          Text(snapshot.data.data()['storeAddress']),
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
                      onTap: () {
                        Provider.of<Authentication>(context, listen: false)
                            .signOut()
                            .then(
                              (value) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyApp(),
                                ),
                                (Route<dynamic> route) => false,
                              ),
                            );
                      },
                    ),
                    Divider(
                      indent: 52.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      child: TextButton(
                        onPressed: () {
                          Provider.of<Authentication>(context, listen: false)
                              .deleteAccount()
                              .then((value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyApp(),
                                    ),
                                    (Route<dynamic> route) => false,
                                  ));
                        },
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
      },
    );
  }
}
