import 'package:design_delivery/ui/courier/widgets/detail_attribute.dart';
import 'package:flutter/material.dart';

class InProgressDeliveryDialogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In Progress Delivery'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Time',
                      style: TextStyle(
                        color: Color(0xFF25408F),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    DetailAttribute(
                      detailFor: 'Time Picked',
                      detailText: 'Time',
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Location',
                      style: TextStyle(
                        color: Color(0xFF25408F),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    DetailAttribute(
                      detailFor: 'Vendor',
                      detailText: 'Address goes here',
                    ),
                    DetailAttribute(
                      detailFor: 'Customer',
                      detailText: 'Address Goes here',
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Vendor / Store',
                      style: TextStyle(
                        color: Color(0xFF25408F),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    DetailAttribute(
                      detailFor: 'Vendor Name',
                      detailText: 'Name goes here',
                    ),
                    DetailAttribute(
                      detailFor: 'Phone',
                      detailText: '+001 0100 1001',
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Customer',
                      style: TextStyle(
                        color: Color(0xFF25408F),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    DetailAttribute(
                      detailFor: 'Customer Name',
                      detailText: 'Name goes here',
                    ),
                    DetailAttribute(
                      detailFor: 'Phone',
                      detailText: '+001 0100 1001',
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Product',
                      style: TextStyle(
                        color: Color(0xFF25408F),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    DetailAttribute(
                      detailFor: 'Product Name',
                      detailText: 'Name goes here',
                    ),
                    DetailAttribute(
                      detailFor: 'Quantity',
                      detailText: 'Value',
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.check_box_outlined,
                  size: 18,
                  color: Colors.white,
                ),
                label: Text(
                  'Complete Delivery',
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
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 8.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
