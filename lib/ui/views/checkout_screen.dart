import 'package:design_delivery/ui/widgets/checkout_form.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final Map<String, int> productsInCart;
  final int subtotal;

  const CheckoutScreen(
      {Key key, @required this.productsInCart, @required this.subtotal})
      : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: CheckoutForm(
            subtotal: widget.subtotal,
            products: widget.productsInCart,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
