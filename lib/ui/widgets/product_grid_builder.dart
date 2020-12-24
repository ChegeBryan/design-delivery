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
      itemBuilder: null,
    );
  }
}
