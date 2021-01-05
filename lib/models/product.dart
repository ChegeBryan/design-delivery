class Product {
  String productName;
  double price;
  String category;
  String description;
  String productImg;
  String storeId;

  Product(
    this.productName,
    this.price,
    this.category,
    this.description,
    this.productImg,
    this.storeId,
  );

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'price': price,
        'category': category,
        'description': description,
        'productImg': productImg,
        'storeId': storeId,
      };
}
