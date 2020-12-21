import 'package:design_delivery/ui/widgets/wishlist_product.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist Page Screen'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: WishlistProduct(),
    );
  }
}
