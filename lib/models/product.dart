import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String productName;
  double price;
  String category;
  String description;
  String productImg;
  String storeId;
  String storeName;

  Product(
    this.productName,
    this.price,
    this.category,
    this.description,
    this.productImg,
    this.storeId,
    this.storeName,
  );

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'price': price,
        'category': category,
        'description': description,
        'productImg': productImg,
        'storeId': storeId,
        'storeName': storeName,
        'createdOn': FieldValue.serverTimestamp(),
      };
}
