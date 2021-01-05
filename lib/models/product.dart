class Product {
  String productName;
  double price;
  String category;
  String description;
  String productImg;

  Product(
    this.productName,
    this.price,
    this.category,
    this.description,
    this.productImg,
  );

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'price': price,
        'category': category,
        'description': description,
        'productImg': productImg,
      };
}
