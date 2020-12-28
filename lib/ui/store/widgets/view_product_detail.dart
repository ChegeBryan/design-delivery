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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ksh. 499',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF515C6F),
                ),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Divider(
          indent: 16,
          endIndent: 16.0,
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF515C6F),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed ullamcorper morbi tincidunt ornare massa eget egestas purus.',
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          indent: 16,
          endIndent: 16.0,
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF515C6F),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Chip(
                  labelStyle: TextStyle(
                    color: Color(0xFF25408F),
                    fontSize: 16.0,
                  ),
                  label: Text(
                    'Lorem ipsum dolor',
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
