import 'package:design_delivery/services/cart.dart';
import 'package:design_delivery/ui/views/checkout_screen.dart';
import 'package:design_delivery/ui/widgets/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final dynamic product;
  final String productId;

  const ProductDetailScreen({Key key, this.product, this.productId})
      : super(key: key);
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ProductDetail(product: widget.product, productId: widget.productId),
      bottomNavigationBar: Material(
        elevation: 4.0,
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                            'KSh. ${widget.product['price']}',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF25408F),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<CartProvider>(
                        context,
                        listen: false,
                      ).addToCart(widget.productId, 1);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.add_shopping_cart_sharp,
                          size: 14,
                          color: Colors.white,
                        ),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
