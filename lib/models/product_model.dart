class ProductModel {
  final String id;
  final String name;
  final double price;
  final String category;
  final String imagePath;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imagePath,
  });

  /// Object Equality
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get totalPrice => product.price * quantity;

  /// copyWith Method
  CartItem copyWith({ProductModel? product, int? quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
