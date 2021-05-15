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

  Future fetchProductsByStoreInArray(String storeId, List productIds) async {
    QuerySnapshot querySnapshot = await products
        .where(FieldPath.documentId, whereIn: productIds)
        .where('storeId', isEqualTo: storeId)
        .get();
    return querySnapshot.docs;
  }

  Future fetchProductsByCategory(String category) async {
    QuerySnapshot querySnapshot =
        await products.where('category', isEqualTo: category).get();
    return querySnapshot.docs;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchProduct(
      String productId) async {
    DocumentSnapshot snapshot = await products.doc(productId).get();
    return snapshot;
  }

  Future fetchProducts() async {
    QuerySnapshot querySnapshot = await products.get();
    return querySnapshot.docs;
  }

  Future fetchProductsInArray(List productIds) async {
    QuerySnapshot querySnapshot =
        await products.where(FieldPath.documentId, whereIn: productIds).get();
    return querySnapshot.docs;
  }

  Future fetchRecentlyAddedProducts() async {
    QuerySnapshot querySnapshot =
        await products.orderBy('createdOn', descending: true).limit(20).get();
    return querySnapshot.docs;
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
