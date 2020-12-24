import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          // what would be typically product image
          image: 'https://picsum.photos/250?image=9',
          height: 250,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Product title with overflow test from here continue',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25408F),
                      ),
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Theme.of(context).primaryColor,
                    ),
                    // toggle wishlist status
                    onPressed: () {},
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                    splashRadius: 1,
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart_sharp),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
