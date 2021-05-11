import 'package:design_delivery/services/auth.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  Authentication auth;

  CartProvider(this.auth);
}
