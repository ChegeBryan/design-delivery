import 'package:design_delivery/services/auth.dart';
import 'package:design_delivery/services/cart.dart';
import 'package:design_delivery/services/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutForm extends StatefulWidget {
  final int subtotal;
  final Map<String, int> products;

  CheckoutForm({
    Key key,
    @required this.subtotal,
    @required this.products,
  });

  @override
  _CheckoutFormState createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  final _formKey = GlobalKey<FormState>();

  String _dropdownValue = 'Kasarani';

  Map<String, int> _deliveryFee = {
    'Kasarani': 100,
    'Githurai': 200,
    'Ruiru': 300,
  };

  final TextEditingController _customerName = TextEditingController();
  final TextEditingController _customerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int _fee = _deliveryFee[_dropdownValue];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Enter Delivery details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color(0xFF25408F)),
                ),
              ),
              TextFormField(
                controller: _customerName,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Full names',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _customerPhone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Phone number cannot be empty';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: DropdownButtonFormField(
                  value: _dropdownValue,
                  items: _deliveryFee.keys
                      .map<DropdownMenuItem<String>>((String value) {
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
                    labelText: "Delivery Address",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Ksh. ${widget.subtotal}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Fee',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Ksh. ${_fee.toString()}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF25408F),
                  ),
                ),
                Text(
                  'Ksh. ${widget.subtotal + _fee}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFF25408F),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Provider.of<OrderProvider>(context, listen: false)
                      .addOrder(
                          customerName: _customerName.text,
                          deliverAddress: _dropdownValue,
                          products: widget.products,
                          subtotal: widget.subtotal,
                          deliveryFee: _fee,
                          customerId: Provider.of<Authentication>(context,
                                  listen: false)
                              .getUid)
                      .then(
                        (value) =>
                            Provider.of<CartProvider>(context, listen: false)
                                .clearCart(),
                      );
                }
              },
              child: Text(
                'Place Order',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(StadiumBorder()),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0)),
                minimumSize: MaterialStateProperty.all(Size(48.0, 8.0)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
