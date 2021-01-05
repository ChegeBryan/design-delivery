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
  ) async {
    product = Product(productName, price, category, description, productImg);
    await products.doc().set(product.toJson());
    notifyListeners();
  }
}
