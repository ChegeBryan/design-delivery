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
    String orderStatus,
  }) async {
    order = Order(
      customerName: customerName,
      deliveryAddress: deliverAddress,
      customerPhone: customerPhone,
      products: products,
      subtotal: subtotal,
      deliveryFee: deliveryFee,
      customerId: customerId,
      orderStatus: orderStatus,
    );
    await orderCollection.doc().set(order.toJson());
    notifyListeners();
  }

  Future getUserOrders(String user) async {
    QuerySnapshot querySnapshot =
        await orderCollection.where('customerId', isEqualTo: user).get();
    return querySnapshot.docs;
  }

  Future getOrders() async {
    QuerySnapshot querySnapshot = await orderCollection.get();
    return querySnapshot.docs;
  }

  Future getOrdersAwaitingDelivery() async {
    QuerySnapshot querySnapshot = await orderCollection
        .where('orderStatus', isEqualTo: 'Awaiting Delivery')
        .get();
    return querySnapshot.docs;
  }

  Future getDeliveredOrders() async {
    QuerySnapshot querySnapshot = await orderCollection
        .where('orderStatus', isEqualTo: 'Delivered')
        .get();
    return querySnapshot.docs;
  }

  Future getOrdersCourierInProgressDeliveries(String courierId) async {
    QuerySnapshot querySnapshot = await orderCollection
        .where('courier', isEqualTo: courierId)
        .where('orderStatus', isEqualTo: 'Delivery Inprogress')
        .get();
    return querySnapshot.docs;
  }

  Future getCourierCompletedDeliveries(String courierId) async {
    QuerySnapshot querySnapshot = await orderCollection
        .where('courier', isEqualTo: courierId)
        .where('orderStatus', isEqualTo: 'Delivered')
        .get();
    return querySnapshot.docs;
  }

  Future updateOrderDeliveryStatus(String orderId, String courierId) async {
    await orderCollection.doc(orderId).update({
      'courier': courierId,
      'orderStatus': 'Delivery Inprogress',
      'deliveryStartTime': FieldValue.serverTimestamp(),
    });
    notifyListeners();
  }

  Future completeOrderDelivery(String orderId) async {
    await orderCollection.doc(orderId).update({
      'orderStatus': 'Delivered',
      'deliveryEndTime': FieldValue.serverTimestamp(),
    });
    notifyListeners();
  }

  Future getOrder(String orderId) async {
    DocumentSnapshot snapshot = await orderCollection.doc(orderId).get();
    return snapshot;
  }
}
