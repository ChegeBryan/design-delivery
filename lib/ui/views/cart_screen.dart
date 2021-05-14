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
  bool _orderSummaryVisibility = false;
  double _containerHeight = 80.0;
  IconData _arrowIconType = Icons.keyboard_arrow_up;

  void _showOrderSummary() {
    setState(() {
      // toggle order summary visbility
      _orderSummaryVisibility = !_orderSummaryVisibility;
      // change container height
      _orderSummaryVisibility
          ? _containerHeight = 160.0
          : _containerHeight = 80.0;
      // change icon type
      _orderSummaryVisibility
          ? _arrowIconType = Icons.keyboard_arrow_down
          : _arrowIconType = Icons.keyboard_arrow_up;
    });
  }

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
      bottomNavigationBar: Material(
        elevation: 4.0,
        child: Container(
          height: _containerHeight,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: _orderSummaryVisibility,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Order Summary',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF25408F),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Items'),
                          Text(
                            '13',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Delivery Fee'),
                        Text(
                          'Ksh. 200',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Total'),
                      Row(
                        children: [
                          Text(
                            'KSh. 563',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF25408F),
                            ),
                          ),
                          IconButton(
                            icon: Icon(_arrowIconType),
                            onPressed: _showOrderSummary,
                            splashRadius: 1,
                          )
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(
                            subtotal: 100,
                            productsInCart: productsInCart,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(StadiumBorder()),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0)),
                      minimumSize: MaterialStateProperty.all(Size(48.0, 8.0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
