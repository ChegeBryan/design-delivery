import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/ui/courier/widgets/detail_attribute.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InProgressDeliveryDialogScreen extends StatelessWidget {
  final String orderId;

  const InProgressDeliveryDialogScreen({
    Key key,
    this.orderId,
  }) : super(key: key);

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
          child: DeliveryDetails(orderId: orderId),
        ),
      ),
    );
  }
}

class DeliveryDetails extends StatelessWidget {
  final String orderId;

  const DeliveryDetails({
    Key key,
    this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<OrderProvider>(context).getOrder(orderId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return Center(child: Text('Order no longer available.'));
          }
          return Column(
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
                      detailText: DateTime.parse(snapshot.data
                              .data()['deliveryStartTime']
                              .toDate()
                              .toString())
                          .toString(),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 50.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Delivery Address',
                      style: TextStyle(
                        color: Color(0xFF25408F),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    DetailAttribute(
                      detailFor: 'Delivering to',
                      detailText: snapshot.data.data()['deliveryAddress'],
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
                      detailText: snapshot.data.data()['customerName'],
                    ),
                    DetailAttribute(
                      detailFor: 'Phone',
                      detailText: snapshot.data.data()['customerPhone'],
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
                      'Products',
                      style: TextStyle(
                        color: Color(0xFF25408F),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    DetailAttribute(
                      detailFor: 'Products Count',
                      detailText:
                          snapshot.data.data()['products'].length.toString(),
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
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
