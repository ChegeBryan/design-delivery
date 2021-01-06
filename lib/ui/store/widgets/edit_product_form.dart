import 'package:cloud_firestore/cloud_firestore.dart';
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
                CustomInputField(
                  label: 'Product Name',
                  inputIcon: Icons.assessment_outlined,
                ),
                CustomInputField(
                  label: 'Price (Ksh.)',
                  inputIcon: Icons.monetization_on_outlined,
                  keyboard: TextInputType.number,
                ),
                CustomInputField(
                  label: 'Product Description',
                  inputIcon: Icons.notes,
                  keyboard: TextInputType.text,
                  maxlines: null,
                ),
                CustomDropdownFormField(listFor: categories),
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
