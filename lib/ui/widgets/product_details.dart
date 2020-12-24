import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetail extends StatefulWidget {
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool _descriptionVisible = false;

  void _toggleDescriptionVisibility() {
    setState(() {
      _descriptionVisible = !_descriptionVisible;
    });
  }

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
            Icons.keyboard_arrow_right_outlined,
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
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed ullamcorper morbi tincidunt ornare massa eget egestas purus.',
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
              "AB",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            'Long text for store name',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xFF515C6F),
            ),
          ),
          subtitle: Text(
            'Long text for store address',
          ),
          isThreeLine: true,
          onTap: () {},
        ),
      ],
    );
  }
}
