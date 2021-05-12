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

    User user = userCredential.user;
    uid = user.uid;

    CollectionReference users = db.collection('users');
    await users.doc(uid).set({
      'username': username,
      'email': email,
      'role': 'user',
    });

    notifyListeners();
  }

  Future registerStore(
    String storeName,
    String storeAddress,
    String email,
    String password,
  ) async {
    UserCredential storeCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    User store = storeCredential.user;
    uid = store.uid;

    CollectionReference users = db.collection('users');
    await users.doc(uid).set({
      'storeName': storeName,
      'storeAddress': storeAddress,
      'email': email,
      'role': 'store',
    });

    notifyListeners();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchStoreData(
      String storeId) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(storeId).get();
    return snapshot;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchUserData(
      String userId) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return snapshot;
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

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future deleteAccount({String email, String password}) async {
    try {
      await FirebaseAuth.instance.currentUser.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        EmailAuthCredential credential =
            EmailAuthProvider.credential(email: email, password: password);
        await FirebaseAuth.instance.currentUser
            .reauthenticateWithCredential(credential);
      }
      EmailAuthCredential credential =
          EmailAuthProvider.credential(email: 'text', password: 'asss');
      await FirebaseAuth.instance.currentUser
          .reauthenticateWithCredential(credential);
    }
  }
}
