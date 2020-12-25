import 'package:design_delivery/ui/store/widgets/custom_dropdown_feild.dart';
import 'package:design_delivery/ui/store/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

// category list for testing
const List categories = <DropdownMenuItem>[
  DropdownMenuItem(child: Text('Category 1'), value: 1),
  DropdownMenuItem(child: Text('Category 2'), value: 2),
  DropdownMenuItem(child: Text('Category 3'), value: 3),
];

class AddContactForm extends StatefulWidget {
  @override
  _AddContactFormState createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomInputField(
            label: 'Product Name',
            inputIcon: Icons.assignment_outlined,
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
}
