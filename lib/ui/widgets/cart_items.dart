import 'package:design_delivery/services/cart.dart';
import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/views/checkout_screen.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';

class CartItems extends StatefulWidget {
  final List<String> products;
  final Map<String, int> productsInCart;

  const CartItems({
    Key key,
    @required this.products,
    @required this.productsInCart,
  }) : super(key: key);

  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  // contains product details of products in cart
  List _productsInCart;
  double subtotal = 0;

  int totalItems() {
    int _totalItemsCount = 0;
    widget.productsInCart.forEach((key, value) => _totalItemsCount += value);
    return _totalItemsCount;
  }

  double calcSubtotal({List productsInCart}) {
    for (var product in productsInCart) {
      subtotal += product['price'];
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ManageProducts>(context)
          .fetchProductsInArray(widget.products),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('Fetching your cart items...'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Your Cart is empty.'),
            );
          }
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('Product no longer available.'),
            );
          }

          _productsInCart = snapshot.data.map((data) => data.data()).toList();
          calcSubtotal(productsInCart: _productsInCart);

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 8.0),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          // toggle wishlist status
                                          onPressed: () {
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .removeCartProduct(
                                                    snapshot.data[index].id);
                                          },
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 8, 0, 8),
                                          splashRadius: 1,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Ksh. ${snapshot.data[index].data()['price'].toString()}',
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
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              // decrement cart item count
                                              onPressed: () {
                                                Provider.of<CartProvider>(
                                                        context,
                                                        listen: false)
                                                    .decrementCartProductCount(
                                                  snapshot.data[index].id,
                                                );
                                              },
                                              splashRadius: 1,
                                            ),
                                            Text(widget.productsInCart[
                                                    snapshot.data[index].id]
                                                .toString()),
                                            IconButton(
                                              icon: Icon(
                                                Icons.add_circle,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              onPressed: () {
                                                Provider.of<CartProvider>(
                                                        context,
                                                        listen: false)
                                                    .incrementCartProductCount(
                                                  snapshot.data[index].id,
                                                );
                                              },
                                              splashRadius: 1,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
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
                ),
              ),
              Material(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Cart Summary',
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
                                  totalItems().toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
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
                              Text(
                                'KSh. ${subtotal.toString()}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF25408F),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckoutScreen(
                                    subtotal: subtotal.toInt(),
                                    productsInCart: widget.productsInCart,
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
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 16.0)),
                              minimumSize:
                                  MaterialStateProperty.all(Size(48.0, 8.0)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
