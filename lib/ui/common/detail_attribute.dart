import 'package:flutter/material.dart';

class DetailAttribute extends StatelessWidget {
  const DetailAttribute({
    Key key,
    @required this.detailFor,
    @required this.detailText,
  }) : super(key: key);

  final String detailFor;
  final String detailText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            detailFor,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            detailText,
            style: TextStyle(),
            textAlign: TextAlign.end,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
