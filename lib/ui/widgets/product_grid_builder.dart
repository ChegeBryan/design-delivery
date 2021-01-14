import 'package:design_delivery/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductGridBuilder extends StatelessWidget {
  const ProductGridBuilder({
    Key key,
    String category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return GridView.builder(
      itemCount: 17, // for test only put product count here
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
      itemBuilder: (BuildContext context, int index) => ProductCard(),
      padding: const EdgeInsets.all(16.0),
    );
  }
}
