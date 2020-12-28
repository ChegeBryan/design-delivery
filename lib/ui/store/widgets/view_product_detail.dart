import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ViewProductDetail extends StatefulWidget {
  @override
  _ViewProductDetailState createState() => _ViewProductDetailState();
}

class _ViewProductDetailState extends State<ViewProductDetail> {
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
        Padding(
          padding: const EdgeInsets.all(16.0),
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
        Divider(
          indent: 16,
          endIndent: 16.0,
        ),
      ],
    );
  }
}
