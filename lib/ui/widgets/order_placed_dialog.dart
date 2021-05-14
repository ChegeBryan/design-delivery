import 'package:flutter/material.dart';

class OrderPlacedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 48,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Order placed.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color(0xFF25408F),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Thank you for shopping with us.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Color(0xFF25408F),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
