class ProductModel {
  final String id;
  final String name;
  final double price;
  final String category;
  final String imagePath;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imagePath,
  });
}

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice => product.price * quantity;
}