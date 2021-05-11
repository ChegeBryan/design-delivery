import 'package:design_delivery/services/cart.dart';
import 'package:design_delivery/services/product.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';

class CartItems extends StatefulWidget {
  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    Map<String, int> productsInCart =
        Provider.of<CartProvider>(context, listen: false).getCartProducts;
    List<String> products = productsInCart.keys.toList();

    return FutureBuilder(
      future:
          Provider.of<ManageProducts>(context).fetchProductsInArray(products),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text('Your Cart is empty.'),
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
                            image: 'https://picsum.photos/250?image=9',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100.0,
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      snapshot.data[index]
                                          .data()['productName'],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF515C6F),
                                      ),
                                      maxLines: 2,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    // toggle wishlist status
                                    onPressed: () {
                                      Provider.of<CartProvider>(context,
                                              listen: false)
                                          .removeCartProduct(
                                              snapshot.data[index].id);
                                    },
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                    splashRadius: 1,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ksh. ${snapshot.data[index].data()['price']}',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF25408F),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.remove_circle,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        // decrement cart item count
                                        onPressed: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .decrementCartProductCount(
                                            snapshot.data[index].id,
                                          );
                                        },
                                        splashRadius: 1,
                                      ),
                                      Text(productsInCart[
                                              snapshot.data[index].id]
                                          .toString()),
                                      IconButton(
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        onPressed: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .incrementCartProductCount(
                                            snapshot.data[index].id,
                                          );
                                        },
                                        splashRadius: 1,
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 0, 8),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
