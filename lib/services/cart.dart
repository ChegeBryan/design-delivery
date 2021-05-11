import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_delivery/services/auth.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  Authentication _auth;
  String user;

  CartProvider(this._auth) {
    if (this._auth != null) {
      user = this._auth.getUid;
    }
  }

  CollectionReference cart = FirebaseFirestore.instance.collection('cart');

  List<String> _cartProducts;

  List<String> get getCartProducts => _cartProducts;

  getCartItems() async {
    /**
     * Get user cart returng list of product ids
     */
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await cart.doc(user).get();
    _cartProducts = List<String>.from(snapshot.data()['products']);
    notifyListeners();
  }

  addToCart(String product) async {
    _cartProducts.add(product);
    await cart.doc(user).set({'products': _cartProducts});
    notifyListeners();
  }
}
