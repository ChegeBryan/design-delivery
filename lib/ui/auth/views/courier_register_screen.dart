import 'package:design_delivery/ui/auth/widgets/cover_image.dart';
import 'package:flutter/material.dart';

class CourierRegisterScreen extends StatefulWidget {
  @override
  _CourierRegisterScreenState createState() => _CourierRegisterScreenState();
}

class _CourierRegisterScreenState extends State<CourierRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [CoverImage()],
            ),
          ),
        ),
      ),
    );
  }
}
