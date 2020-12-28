import 'package:design_delivery/ui/store/views/edit_product_dialog_screen.dart';
import 'package:design_delivery/ui/store/views/product_detail_dialog_screen.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductListBuilder extends StatelessWidget {
  const ProductListBuilder({
    Key key,
  }) : super(key: key);

  Future<void> _confirmDeleteDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure you want to delete product?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Deleted products cannot be retrieved.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _lauchEditProductDialog(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => EditProductDialogScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  void _launchProductDetailDialog(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => ProductDetailDialogScreen(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int) => Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _launchProductDetailDialog(context);
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: 'https://picsum.photos/250?image=9',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100.0,
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Product title with overflow test from here continue',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF515C6F),
                                  ),
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Theme.of(context).primaryColor,
                                ),
                                // toggle wishlist status
                                onPressed: () =>
                                    _lauchEditProductDialog(context),
                                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                splashRadius: 1,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ksh. 399.00',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF25408F),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Theme.of(context).primaryColor,
                                ),
                                // toggle wishlist status
                                onPressed: () {
                                  _confirmDeleteDialog(context);
                                },
                                splashRadius: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Divider(
                indent: 116,
                endIndent: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
