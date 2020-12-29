import 'package:design_delivery/ui/courier/widgets/detail_attribute.dart';
import 'package:flutter/material.dart';

class DeliveryDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Details'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: () {}, child: Text('Decline')),
                  ElevatedButton(onPressed: () {}, child: Text('Accept')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
