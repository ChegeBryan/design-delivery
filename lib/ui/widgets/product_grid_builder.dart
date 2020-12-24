import 'package:design_delivery/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductGridBuilder extends StatelessWidget {
  const ProductGridBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 17, // for test only put product count here
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) => ProductCard(),
      padding: const EdgeInsets.all(16.0),
    );
  }
}
