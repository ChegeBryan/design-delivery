import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist Page Screen'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int) => Row(
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Product title',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF515C6F),
                      ),
                    ),
                    Text('Ksh. 399.00'),
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
