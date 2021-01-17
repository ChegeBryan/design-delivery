import 'package:design_delivery/services/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductsGrid extends StatefulWidget {
  @override
  _AllProductsGridState createState() => _AllProductsGridState();
}

class _AllProductsGridState extends State<AllProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ManageProducts>(context).fetchProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('No products found.'),
            );
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
