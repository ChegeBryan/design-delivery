import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  CollectionReference wishlist =
      FirebaseFirestore.instance.collection('wishlist');

  List<String> _wishlistProducts;

  List<String> get getWishlistProducts => _wishlistProducts;

  getWishListItems(String user) async {
    DocumentSnapshot items = await wishlist.doc(user).get();
    _wishlistProducts = List<String>.from(items.data()['products']);
    notifyListeners();
  }
}
