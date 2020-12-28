import 'package:flutter/material.dart';

class FormBottomText extends StatelessWidget {
  const FormBottomText({
    Key key,
    @required this.message,
    @required this.actionMessage,
    @required this.swipeTo,
  }) : super(key: key);

  final String message;
  final String actionMessage;
  final Widget swipeTo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Center(
        child: Column(
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => swipeTo),
                );
              },
              child: Text(
                actionMessage,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
