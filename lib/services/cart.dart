import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_delivery/services/auth.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Authentication _auth;
  String user;

  CartProvider(this._auth) {
    if (this._auth != null) {
      user = this._auth.getUid;
      getCartItems();
    }
  }

  CollectionReference cart = FirebaseFirestore.instance.collection('cart');

  Map<String, int> _cartProducts;

  Map<String, int> get getCartProducts => _cartProducts;

  getCartItems() async {
    /**
     * Get user cart returng list of product ids
     */
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await cart.doc(user).get();

    if (snapshot.data() != null) {
      _cartProducts = Map<String, int>.from(snapshot.data()['products']);
      notifyListeners();
    } else {
      _cartProducts = {};
      notifyListeners();
    }
  }

  addToCart(String product, int count) async {
    _cartProducts.putIfAbsent(product, () => count);
    await cart.doc(user).set({'products': _cartProducts});
    notifyListeners();
  }

  incrementCartProductCount(String product) async {
    _cartProducts.update(product, (count) => count + 1);
    await cart.doc(user).set({'products': _cartProducts});
    notifyListeners();
  }

  decrementCartProductCount(String product) async {
    _cartProducts.update(product, (count) => count - 1);
    await cart.doc(user).set({'products': _cartProducts});
    notifyListeners();
  }

  removeCartProduct(String product) async {
    _cartProducts.remove(product);
    await cart.doc(user).set({'products': _cartProducts});
    notifyListeners();
  }

  clearCart() async {
    _cartProducts.clear();
    await cart.doc(user).delete();
    notifyListeners();
  }
}
