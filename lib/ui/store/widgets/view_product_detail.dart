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
      ],
    );
  }
}
