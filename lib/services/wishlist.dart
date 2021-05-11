import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_delivery/services/auth.dart';
import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  Authentication auth;

  WishlistProvider(this.auth) {
    if (this.auth != null) {
      getWishListItems();
    }
  }

  CollectionReference wishlist =
      FirebaseFirestore.instance.collection('wishlist');

  List<String> _wishlistProducts;
  List<String> get getWishlistProducts => _wishlistProducts;

  getWishListItems() async {
    String user = auth.getUid;
    DocumentSnapshot<Map<String, dynamic>> items =
        await wishlist.doc(user).get();
    _wishlistProducts = List<String>.from(items.data()['products']);
    notifyListeners();
  }

  addToWishlist(String product, String user) async {
    _wishlistProducts.add(product);
    await wishlist.doc(user).set({'products': _wishlistProducts});
    notifyListeners();
  }

  removeFromWishlist(String product, String user) async {
    _wishlistProducts.remove(product);
    await wishlist.doc(user).set({'products': _wishlistProducts});
    notifyListeners();
  }
}
