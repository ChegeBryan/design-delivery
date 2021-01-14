import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/carousel/photo-1460353581641-37baddab0fa2.jpeg',
  'assets/carousel/photo-1522335789203-aabd1fc54bc9.jpeg',
  'assets/carousel/photo-1544441893-675973e31985.jpeg',
  'assets/carousel/photo-1483985988355-763728e1935b.jpeg',
  'assets/carousel/photo-1598460880248-71ec6d2d582b.jpeg',
  'assets/carousel/photo-1535632787350-4e68ef0ac584.jpeg'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.asset(item, fit: BoxFit.cover, width: 1000.0),
            ),
          ),
        ))
    .toList();

class HomeCarousel extends StatelessWidget {
  @override
  Column build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),
      ],
    );
  }
}
