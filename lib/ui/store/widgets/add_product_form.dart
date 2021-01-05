import 'package:flutter/material.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _productName = TextEditingController()

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
    String _dropdownValue = 'Shoes';
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
            controller: _productName,
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
          Padding(
            padding: EdgeInsets.fromLTRB(42.0, 16.0, 0, 0),
            child: DropdownButtonFormField(
              value: _dropdownValue,
              items: <String>[
                'Shoes',
                'Clothes',
                'Jewellery',
                'Bags',
                'Makeup',
                'Skincare',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
          ),
        ],
      ),
    );
  }
}
