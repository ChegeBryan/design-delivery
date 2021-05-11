import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_delivery/services/auth.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  Authentication _auth;
  String user;

  CartProvider(this._auth) {
    if (this._auth != null) {
      user = this._auth.getUid;
      getCartItems();
    }
  }

  CollectionReference cart = FirebaseFirestore.instance.collection('cart');

  Map<String, int> _cartProducts = {};

  Map<String, int> get getCartProducts => _cartProducts;

  getCartItems() async {
    /**
     * Get user cart returng list of product ids
     */
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await cart.doc(user).get();
    _cartProducts = snapshot.data()['products'];
    notifyListeners();
  }

  addToCart(String product, int count) async {
    _cartProducts.putIfAbsent(product, () => count);
    await cart.doc(user).set({'products': _cartProducts});
    notifyListeners();
  }
}
