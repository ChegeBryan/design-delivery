import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetail extends StatefulWidget {
  final dynamic product;

  const ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _descriptionVisible = false;
  IconData _descriptionIcon = Icons.keyboard_arrow_right_outlined;

  void _toggleDescriptionVisibility() {
    setState(() {
      _descriptionVisible = !_descriptionVisible;
      _descriptionVisible
          ? _descriptionIcon = Icons.keyboard_arrow_down_outlined
          : _descriptionIcon = Icons.keyboard_arrow_right_outlined;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          // what would be typically product image
          image: widget.product['productImg'],
          height: 250,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Column(
            // product name sections
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.product['productName'],
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
                icon: Icon(
                  Icons.add_shopping_cart_sharp,
                  color: Color(0xFF25408F),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Divider(),
        Container(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Standard Delivery',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF515C6F),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery Fee'),
                    Text(
                      'Ksh. 200',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
        ListTile(
          title: Text(
            'Description',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF515C6F),
            ),
          ),
          trailing: Icon(
            _descriptionIcon,
            color: Color(0xFF515C6F),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          onTap: _toggleDescriptionVisibility,
        ),
        Visibility(
          visible: _descriptionVisible,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.product['description'],
              softWrap: true,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Vendor Store',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFF515C6F),
            ),
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.amber,
            child: Text(
              widget.product['storeName'][0].toUpperCase(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            widget.product['storeName'],
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xFF515C6F),
            ),
          ),
        ),
      ],
    );
  }
}
