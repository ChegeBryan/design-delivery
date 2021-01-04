import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authentication with ChangeNotifier {
  String uid;
  String get getUid => uid;

  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future registerUserAccount(
    String username,
    String email,
    String password,
  ) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await userCredential.user.updateProfile(displayName: username);

    User user = userCredential.user;
    uid = user.uid;

    CollectionReference users = db.collection('users');
    await users.doc(uid).set({
      'role': 'user',
      'username': username,
    });

    notifyListeners();
  }

  Future loginUserAccount(
    String email,
    String password,
  ) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    uid = user.uid;
    notifyListeners();
  }
}
