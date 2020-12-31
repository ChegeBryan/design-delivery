import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key key,
    @required this.label,
    @required this.prefixIcon,
    this.keyboard = TextInputType.text,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final IconData prefixIcon;
  final TextInputType keyboard;
  final bool obscureText;

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Colors.amber,
      keyboardType: widget.keyboard,
      autocorrect: false,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon),
        labelText: widget.label,
        border: InputBorder.none,
        contentPadding: EdgeInsets.fromLTRB(0, 8, 8, 8),
      ),
      obscureText: widget.obscureText,
      textAlignVertical: TextAlignVertical.center,
    );
  }
}
