import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String customerName;
  String customerId;
  String deliveryAddress;
  int subtotal;
  int deliveryFee;
  Map<String, int> products;

  Order({
    this.customerName,
    this.customerId,
    this.deliveryAddress,
    this.subtotal,
    this.deliveryFee,
    this.products,
  });

  Map<String, dynamic> toJson() => {
        'customerName': customerName,
        'customerId': customerId,
        'deliveryAddress': deliveryAddress,
        'subtotal': subtotal,
        'deliveryFee': deliveryFee,
        'products': products,
        'createdOn': FieldValue.serverTimestamp(),
      };
}
