import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/services/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class WishlistProducts extends StatefulWidget {
  const WishlistProducts({
    Key key,
  }) : super(key: key);

  @override
  _WishlistProductsState createState() => _WishlistProductsState();
}

class _WishlistProductsState extends State<WishlistProducts> {
  @override
  Widget build(BuildContext context) {
    List<String> wishlist =
        Provider.of<WishlistProvider>(context).getWishlistProducts;
    return FutureBuilder(
      future:
          Provider.of<ManageProducts>(context).fetchProductsInArray(wishlist),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text('Your wishlist is empty.'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('Product no longer available.'),
            );
          }
          return ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: snapshot.data[index].data()['productImg'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100.0,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                snapshot.data[index].data()['productName'],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF515C6F),
                                ),
                              ),
                              Text(
                                'Ksh. ${snapshot.data[index].data()['price']}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF25408F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        ),
                        // toggle wishlist status
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              indent: 116,
              endIndent: 16,
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
