import 'package:design_delivery/services/orders.dart';
import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/common/order_product.dart';
import 'package:design_delivery/ui/courier/widgets/detail_attribute.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryDetailsScreen extends StatelessWidget {
  final String orderId;

  const DeliveryDetailsScreen({Key key, this.orderId}) : super(key: key);

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
          child: DeliveryDetails(
            orderId: orderId,
          ),
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
            return Center(child: Text('Order no londer available.'));
          }

          Map<String, dynamic> orderSnapshot = snapshot.data.data();

          int subtotal = snapshot.data.data()['subtotal'];
          int deliveryFee = snapshot.data.data()['deliveryFee'];
          int getProductCount() {
            int _count = 0;
            orderSnapshot['products'].forEach((key, value) {
              _count += value;
            });
            return _count;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Order',
                      style: TextStyle(
                        color: Color(0xFF25408F),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    DetailAttribute(
                      detailFor: 'OrderId',
                      detailText: orderId,
                    ),
                    DetailAttribute(
                      detailFor: 'Order Time',
                      detailText: DateTime.parse(snapshot.data
                              .data()['createdOn']
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
                      'Location',
                      style: TextStyle(
                        color: Color(0xFF25408F),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    DetailAttribute(
                      detailFor: 'Deliver to',
                      detailText: orderSnapshot['deliveryAddress'],
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
                      detailText: orderSnapshot['customerName'],
                    ),
                    DetailAttribute(
                      detailFor: 'Phone',
                      detailText: orderSnapshot['customerPhone'],
                    ),
                  ],
                ),
              ),
              Divider(),
              Text(
                'Products',
                style: TextStyle(
                  color: Color(0xFF25408F),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FutureBuilder(
                    future: Provider.of<ManageProducts>(context)
                        .fetchProductsInArray(
                            orderSnapshot['products'].keys.toList()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => OrderProduct(
                            snapshot: snapshot,
                            index: index,
                            orderProducts: orderSnapshot,
                          ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: snapshot.data.length,
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 150.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Order Summary',
                      style: TextStyle(
                        color: Color(0xFF25408F),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    DetailAttribute(
                      detailFor: 'Products',
                      detailText: orderSnapshot['products'].length.toString(),
                    ),
                    DetailAttribute(
                      detailFor: 'Total Quantity',
                      detailText: getProductCount().toString(),
                    ),
                    DetailAttribute(
                      detailFor: 'Total Value',
                      detailText: 'Ksh. ${subtotal.toString()}',
                    ),
                    DetailAttribute(
                      detailFor: 'Delivery fee',
                      detailText: 'Ksh. ${deliveryFee.toString()}',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Intiate Delivery',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0)),
                    minimumSize: MaterialStateProperty.all(Size(48.0, 8.0)),
                  ),
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
