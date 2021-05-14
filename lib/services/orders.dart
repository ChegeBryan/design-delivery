import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_delivery/models/order.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  Order order;
  CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('order');

  addOrder({
    String customerName,
    String customerId,
    String customerPhone,
    String deliverAddress,
    Map<String, int> products,
    int subtotal,
    int deliveryFee,
  }) async {
    order = Order(
      customerName: customerName,
      deliveryAddress: deliverAddress,
      customerPhone: customerPhone,
      products: products,
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      customerId: customerId,
    );
    await orderCollection.doc().set(order.toJson());
    notifyListeners();
  }

  Future getUserOrders(String user) async {
    QuerySnapshot querySnapshot =
        await orderCollection.where('customerId', isEqualTo: user).get();
    return querySnapshot.docs;
  }

  Future getOrder(String orderId) async {
    DocumentSnapshot snapshot = await orderCollection.doc(orderId).get();
    return snapshot;
  }
}
