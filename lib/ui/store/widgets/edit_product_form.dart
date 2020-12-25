import 'package:design_delivery/ui/store/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

class EditProductForm extends StatefulWidget {
  @override
  _EditProductFormState createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  final _formKey = GlobalKey<FormState>();

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
                  onPressed: () {},
                ),
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
        ],
      ),
    );
  }
}
