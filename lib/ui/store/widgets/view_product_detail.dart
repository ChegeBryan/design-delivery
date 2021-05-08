import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_delivery/services/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ViewProductDetail extends StatefulWidget {
  final String productId;

  const ViewProductDetail({Key key, @required this.productId})
      : super(key: key);

  @override
  _ViewProductDetailState createState() => _ViewProductDetailState();
}

class _ViewProductDetailState extends State<ViewProductDetail> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future:
          Provider.of<ManageProducts>(context).fetchProduct(widget.productId),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.data.exists) {
            return Center(
              child: Text('Product not found.'),
            );
          }
          return ListView(
            children: [
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                // what would be typically product image
                image: snapshot.data.data()['productImg'],
                height: 250,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                    child: Text(
                      snapshot.data.data()['productName'],
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
                      'Ksh. ${snapshot.data.data()['price'].toStringAsFixed(0)}',
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
                        snapshot.data.data()['description'],
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
                          snapshot.data.data()['category'],
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
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
