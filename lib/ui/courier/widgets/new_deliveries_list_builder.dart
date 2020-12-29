import 'package:flutter/material.dart';

class NewDeliveriesListBuilder extends StatelessWidget {
  const NewDeliveriesListBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (BuildContext context, int) => SizedBox(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vendor Name',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Name goes here'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vendor Address',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Address goes here'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Deliver To',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Address goes here'),
                ],
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => Divider(),
      padding: const EdgeInsets.all(16.0),
    );
  }
}
