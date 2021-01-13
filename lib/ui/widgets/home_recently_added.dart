import 'package:design_delivery/services/product.dart';
import 'package:design_delivery/ui/views/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeRecentlyAdded extends StatelessWidget {
  const HomeRecentlyAdded({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ManageProducts>(context).fetchRecentlyAddedProducts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              height: 150.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  height: 150,
                  width: 120,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(),
                      ),
                    ),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 4 / 3,
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: 'https://picsum.photos/250?image=9',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                            child: Text(
                              'Title ddddddddddd',
                              style: TextStyle(
                                color: Color(0xFF727C8E),
                                fontSize: 16.0,
                                fontFamily: 'Lato',
                              ),
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                            child: Text(
                              'Ksh. 499.00',
                              style: TextStyle(
                                color: Color(0xFF727C8E),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return SizedBox(
          height: 150.0,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
