import 'package:design_delivery/services/cart.dart';
import 'package:design_delivery/ui/views/checkout_screen.dart';
import 'package:design_delivery/ui/widgets/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, int> productsInCart =
        Provider.of<CartProvider>(context).getCartProducts;
    List<String> products = productsInCart.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: CartItems(
        products: products,
        productsInCart: productsInCart,
      ),
    );
  }
}
