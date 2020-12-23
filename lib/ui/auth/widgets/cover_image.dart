import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/cover.png',
      fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width,
    );
  }
}
