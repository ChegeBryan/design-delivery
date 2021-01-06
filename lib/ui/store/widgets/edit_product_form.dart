import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design_delivery/helpers/validators.dart';
import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/store/widgets/custom_dropdown_feild.dart';
import 'package:design_delivery/ui/store/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

const List categories = <DropdownMenuItem>[
  DropdownMenuItem(child: Text('Category 1'), value: 1),
  DropdownMenuItem(child: Text('Category 2'), value: 2),
  DropdownMenuItem(child: Text('Category 3'), value: 3),
];

class EditProductForm extends StatefulWidget {
  final String productId;

  const EditProductForm({Key key, @required this.productId}) : super(key: key);

  @override
  _EditProductFormState createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  final _formKey = GlobalKey<FormState>();

  String _dropdownValue;
  String _productName;
  String _description;
  String _price;

  Future<void> _imageSourceOptions() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Change Product Photo'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {},
                child: const Text('Remove photo'),
                padding:
                    const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 24.0),
              ),
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
    return FutureBuilder<DocumentSnapshot>(
      future:
          Provider.of<ManageProducts>(context).fetchProduct(widget.productId),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Form(
            key: _formKey,
            onChanged: () {
              Form.of(primaryFocus.context).save();
            },
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
                      backgroundImage:
                          NetworkImage(snapshot.data.data()['productImg']),
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: snapshot.data.data()['productName'],
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
                  onSaved: (newValue) => _productName = newValue,
                ),
                Padding(padding: const EdgeInsets.only(bottom: 16.0)),
                TextFormField(
                  initialValue: snapshot.data.data()['price'].toString(),
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
                  onSaved: (newValue) => _price = newValue,
                ),
                Padding(padding: const EdgeInsets.only(bottom: 16.0)),
                TextFormField(
                  initialValue: snapshot.data.data()['description'],
                  keyboardType: TextInputType.multiline,
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
                  onSaved: (newValue) => _description = newValue,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(42.0, 16.0, 0, 0),
                  child: DropdownButtonFormField(
                    value: snapshot.data.data()['category'],
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
                    onSaved: (newValue) => _dropdownValue = newValue,
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
                        // update all form field values
                        _formKey.currentState.save();
                      }
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 18,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Update Product',
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
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
