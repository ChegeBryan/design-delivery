import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Stores extends ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future fetchStores() async {
    QuerySnapshot querySnapshot =
        await users.where('role', isEqualTo: 'store').get();
    return querySnapshot.docs;
  }
}
