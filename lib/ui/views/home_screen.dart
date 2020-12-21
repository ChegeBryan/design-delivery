import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          // category container
          Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          color: Color(0xFF254081),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Shop More'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(
                    height: 150.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 150,
                        width: 120,
                        child: Card(
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
                                  'Title',
                                  style: TextStyle(
                                    color: Color(0xFF727C8E),
                                    fontSize: 16.0,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.0),
          // Stores container
          Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stores',
                        style: TextStyle(
                          color: Color(0xFF254081),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Shop More'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SizedBox(
                    height: 150.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) => Card(
                        child: Center(child: Text('Dummy Card')),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
