import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatefulWidget {
  final List<DropdownMenuItem> listFor;

  const CustomDropdownFormField({
    @required this.listFor,
    Key key,
  })  : assert(listFor != null),
        super(key: key);

  @override
  _CustomDropdownFormFieldState createState() =>
      _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    int _dropdownValue = 1;

    return Padding(
      padding: EdgeInsets.only(left: 42.0),
      child: DropdownButtonFormField(
        value: _dropdownValue,
        items: widget.listFor,
        onChanged: (value) {
          setState(() {
            _dropdownValue = value;
          });
        },
        decoration: InputDecoration(
          labelText: "Product Category",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
