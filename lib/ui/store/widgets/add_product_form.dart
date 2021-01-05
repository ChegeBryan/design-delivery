import 'package:design_delivery/ui/store/widgets/custom_dropdown_feild.dart';
import 'package:design_delivery/ui/store/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

// category list for testing
const List categories = <DropdownMenuItem>[
  DropdownMenuItem(child: Text('Category 1'), value: 1),
  DropdownMenuItem(child: Text('Category 2'), value: 2),
  DropdownMenuItem(child: Text('Category 3'), value: 3),
];

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();

  Future<void> _imageSourceOptions() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Choose Product Photo'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {},
                child: const Text('Take new photo'),
                padding:
                    const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 24.0),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: const Text('Select new photo'),
                padding:
                    const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 24.0),
              ),
            ],
          );
        })) {
      // Code to run when an option is selected
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            height: 120,
            child: FractionallySizedBox(
              heightFactor: 0.5,
              child: CircleAvatar(
                radius: 40.0,
                child: IconButton(
                  icon: Icon(Icons.add_a_photo_outlined),
                  onPressed: _imageSourceOptions,
                ),
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.assignment_outlined),
              labelText: 'Product Name',
              border: OutlineInputBorder(),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 16.0)),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(Icons.monetization_on_outlined),
              labelText: 'Price (Ksh.)',
              border: OutlineInputBorder(),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 16.0)),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.notes),
              labelText: 'Product Description',
              border: OutlineInputBorder(),
            ),
            maxLines: null,
          ),
          CustomDropdownFormField(listFor: categories),
        ],
      ),
    );
  }
}
