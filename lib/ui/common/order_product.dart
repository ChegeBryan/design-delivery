import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class OrderProduct extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;
  final Map<String, dynamic> orderProducts;

  const OrderProduct({
    Key key,
    this.snapshot,
    this.index,
    this.orderProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Store:  ${snapshot.data[index].data()['storeName']}",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              height: 75.0,
              width: 75.0,
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: snapshot.data[index].data()['productImg'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 75.0,
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        snapshot.data[index].data()['productName'],
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF515C6F),
                        ),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Ksh. ${snapshot.data[index].data()['price'].toString()} * ${orderProducts['products'][snapshot.data[index].id]}',
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
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "${snapshot.data[index].data()['category']}",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
