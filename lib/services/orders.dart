import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_delivery/models/order.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  Order order;
  CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('order');

  addOrder({
    String customerName,
    String deliverAddress,
    Map<String, int> products,
    int subtotal,
    int deliveryFee,
    String user,
  }) async {
    order = Order(
        customerName: customerName,
        deliveryAddress: deliverAddress,
        products: products,
        subtotal: subtotal,
        deliveryFee: deliveryFee);
    await orderCollection.doc(user).set(order.toJson());
    notifyListeners();
  }
}
