import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductsGrid extends StatefulWidget {
  @override
  _AllProductsGridState createState() => _AllProductsGridState();
}

class _AllProductsGridState extends State<AllProductsGrid> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return FutureBuilder(
      future: Provider.of<ManageProducts>(context).fetchProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('No products found.'),
            );
          }
          return GridView.builder(
            itemCount: snapshot.data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (BuildContext context, int index) => ProductCard(
              product: snapshot.data[index].data(),
              productId: snapshot.data[index].id,
            ),
            padding: const EdgeInsets.all(8.0),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
