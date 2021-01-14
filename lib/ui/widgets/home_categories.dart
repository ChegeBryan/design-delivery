import 'package:design_delivery/ui/views/products_by_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/shoe.svg", "text": "Shoes"},
      {"icon": "assets/icons/casual-t-shirt.svg", "text": "Clothes"},
      {"icon": "assets/icons/necklace.svg", "text": "Jewellery"},
      {"icon": "assets/icons/bag.svg", "text": "Bags"},
      {"icon": "assets/icons/cosmetics.svg", "text": "Makeup"},
      {"icon": "assets/icons/skincare.svg", "text": "Skincare"}
    ];

    return Container(
      color: Colors.grey[100],
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
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                categories.length,
                (index) => Expanded(
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsByCateory(),
                      ),
                    ),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            width: MediaQuery.of(context).size.width * 0.14,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                              categories[index]['icon'],
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            categories[index]['text'],
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
