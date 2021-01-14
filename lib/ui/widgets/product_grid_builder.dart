import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGridBuilder extends StatelessWidget {
  final String category;

  const ProductGridBuilder({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return FutureBuilder(
      future: Provider.of<ManageProducts>(context)
          .fetchProductsByCategory(category),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return GridView.builder(
          itemCount: snapshot.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          itemBuilder: (BuildContext context, int index) => ProductCard(),
          padding: const EdgeInsets.all(16.0),
        );
      },
    );
  }
}
