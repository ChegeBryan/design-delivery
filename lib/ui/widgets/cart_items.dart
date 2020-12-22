import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';

class CartItems extends StatefulWidget {
  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int) => Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Product title',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF515C6F),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Theme.of(context).primaryColor,
                              ),
                              // toggle wishlist status
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Text(
                          'Ksh. 399.00',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF25408F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove_circle,
                            color: Theme.of(context).primaryColor,
                          ),
                          // toggle wishlist status
                          onPressed: () {},
                          splashRadius: 20.0,
                        ),
                        Text('3'),
                        IconButton(
                          icon: Icon(
                            Icons.add_circle,
                            color: Theme.of(context).primaryColor,
                          ),
                          // toggle wishlist status
                          onPressed: () {},
                          splashRadius: 20.0,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Divider(
                indent: 116,
                endIndent: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
