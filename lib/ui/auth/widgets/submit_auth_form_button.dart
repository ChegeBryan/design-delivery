import 'package:flutter/material.dart';

class SubmitAuthFormButton extends StatelessWidget {
  const SubmitAuthFormButton({
    Key key,
    @required this.buttonLabel,
    this.action,
  }) : super(key: key);

  final String buttonLabel;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 48),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(),
            Text(
              buttonLabel,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              size: 18,
              color: Colors.white,
            ),
          ],
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          padding:
              MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16.0)),
        ),
      ),
    );
  }
}
