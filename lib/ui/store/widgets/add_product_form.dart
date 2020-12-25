import 'package:design_delivery/ui/store/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';

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
          )
        ],
      ),
    );
  }
}
