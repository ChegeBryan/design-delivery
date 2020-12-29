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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Vendor Name',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Name goes here shbhbs hsbhbshs hbshbshs hsh hbs',
                      style: TextStyle(),
                      textAlign: TextAlign.end,
                      softWrap: true,
                    ),
                  ),
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
