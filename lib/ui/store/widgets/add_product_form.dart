import 'package:design_delivery/helpers/validators.dart';
import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/services/product.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _productName = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();

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
            validator: (value) {
              if (value.isEmpty) {
                return 'Product name cannot be empty';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.only(bottom: 16.0)),
          TextFormField(
            controller: _price,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              icon: Icon(Icons.monetization_on_outlined),
              labelText: 'Price (Ksh.)',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Product price cannot be empty';
              } else if (!isNumeric(value)) {
                return 'Product price should be a number';
              } else if (double.parse(value) < 1) {
                return 'Product price cannot be less than 1';
              }
              return null;
            },
          ),
          Padding(padding: const EdgeInsets.only(bottom: 16.0)),
          TextFormField(
            controller: _description,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.notes),
              labelText: 'Product Description',
              border: OutlineInputBorder(),
            ),
            maxLines: null,
            validator: (value) {
              if (value.isEmpty) {
                return 'Product description must be provided';
              }
              return null;
            },
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
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 48),
            child: ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // if form is valid
                  // send data to firestore
                  Provider.of<ManageProducts>(context, listen: false)
                      .addProduct(
                        _productName.text,
                        double.parse(_price.text),
                        _dropdownValue,
                        _description.text,
                        'https://picsum.photos/250?image=9',
                        Provider.of<Authentication>(context, listen: false)
                            .getUid,
                      )
                      .then((value) => Navigator.pop(context));
                }
              },
              icon: Icon(
                Icons.add,
                size: 18,
                color: Colors.white,
              ),
              label: Text(
                'Add Product',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(StadiumBorder()),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 16.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
