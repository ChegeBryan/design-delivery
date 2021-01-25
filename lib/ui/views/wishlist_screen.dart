import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/services/wishlist.dart';
import 'package:design_delivery/ui/widgets/wishlist_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<String> tempWishlist;

  @override
  void initState() {
    super.initState();
    WishlistProvider wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    wishlistProvider.getWishListItems(
        Provider.of<Authentication>(context, listen: false).getUid);
    tempWishlist = List<String>.from(wishlistProvider.getWishlistProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: WishlistProducts(
        wishlistData: tempWishlist,
      ),
    );
  }
}
