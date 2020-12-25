import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    Key key,
    @required this.label,
    @required this.inputIcon,
    this.keyboard = TextInputType.text,
    this.maxlines = 1,
  }) : super(key: key);

  final IconData inputIcon;
  final String label;
  final TextInputType keyboard;
  final int maxlines;

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        keyboardType: widget.keyboard,
        decoration: InputDecoration(
          icon: Icon(widget.inputIcon),
          labelText: widget.label,
          border: OutlineInputBorder(),
        ),
        maxLines: widget.maxlines,
      ),
    );
  }
}
