import 'package:design_delivery/services/wishlist.dart';
import 'package:design_delivery/ui/views/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatefulWidget {
  final dynamic product;
  final String productId;

  const ProductCard({
    Key key,
    this.product,
    this.productId,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              product: widget.product,
              productId: widget.productId,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.product['productImg'],
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product['productName'],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF515C6F),
                          ),
                        ),
                        Text(
                          'Ksh. ${widget.product['price']}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF25408F),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Provider.of<WishlistProvider>(context)
                                .getWishlistProducts
                                .contains(widget.productId)
                            ? Icon(
                                Icons.favorite,
                                color: Theme.of(context).primaryColor,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Theme.of(context).primaryColor,
                              ),
                        // toggle wishlist status
                        onPressed: () {},
                        splashRadius: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
