import 'package:design_delivery/ui/widgets/wishlist_product.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(),
      bottomNavigationBar: Container(
        height: 80.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
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
                      icon: Icon(Icons.keyboard_arrow_up),
                      onPressed: () {},
                      splashRadius: 1,
                    )
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(StadiumBorder()),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0)),
                minimumSize: MaterialStateProperty.all(Size(48.0, 8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
