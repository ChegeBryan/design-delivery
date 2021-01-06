import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:design_delivery/models/product.dart';

class ManageProducts extends ChangeNotifier {
  Product product;
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future addProduct(
    String productName,
    double price,
    String category,
    String description,
    String productImg,
    String storeId,
    String storeName,
  ) async {
    product = Product(productName, price, category, description, productImg,
        storeId, storeName);
    await products.doc().set(product.toJson());
    notifyListeners();
  }

  Future fetchProductsByStore(String storeId) async {
    QuerySnapshot querySnapshot =
        await products.where('storeId', isEqualTo: storeId).get();
    return querySnapshot.docs;
  }

  Future<DocumentSnapshot> fetchProduct(String productId) async {
    DocumentSnapshot snapshot = await products.doc(productId).get();
    return snapshot;
  }

  Future updateProduct(
    String productId,
    String productName,
    double price,
    String category,
    String description,
  ) async {
    await products.doc(productId).update({
      'productName': productName,
      'price': price,
      'category': category,
      'description': description,
    });
    notifyListeners();
  }

  Future deleteProduct(
    String productId,
  ) async {
    await products.doc(productId).delete();
    notifyListeners();
  }
}
