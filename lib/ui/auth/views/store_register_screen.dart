import 'package:design_delivery/ui/auth/widgets/cover_image.dart';
import 'package:design_delivery/ui/auth/widgets/form_bottom_text.dart';
import 'package:design_delivery/ui/auth/widgets/register_store_form.dart';
import 'package:flutter/material.dart';

class StoreRegisterScreen extends StatefulWidget {
  @override
  _StoreRegisterScreenState createState() => _StoreRegisterScreenState();
}

class _StoreRegisterScreenState extends State<StoreRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CoverImage(),
                RegisterStoreForm(),
                FormBottomText(
                  message: 'Want to make deliveries? Swipe right to',
                  actionMessage: 'Register as a courier',
                  swipeTo: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
