import 'package:design_delivery/main.dart';
import 'package:design_delivery/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourierProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: FutureBuilder(
          future: Provider.of<Authentication>(context)
              .fetchCourierData(Provider.of<Authentication>(context).getUid),
          builder: (context, snapshot) {
            return ListView(
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
                              snapshot.data.data()['courierName'],
                              style: TextStyle(
                                color: Color(0xFF25408F),
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(snapshot.data.data()['courierEmail']),
                            Text(snapshot.data.data()['courierPhone']),
                          ],
                        ),
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
                                (value) =>
                                    Navigator.of(context, rootNavigator: true)
                                        .pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()),
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
            );
          }),
    );
  }
}
