import 'package:cartify/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  final Map<String, CartItem> _items = {};

  Map<String, CartItem>get items=> _items;

  /// total item count
  int get totalItemCount {
    int total = 0;
    _items.forEach((key, item){
      total += item.quantity;
    });
    return total;
  }

  /// sub total
  double get subtotal{
    double total = 0.0;
    _items.forEach((key, item){
      total += item.totalPrice;
    });
    return total;
  }

  /// 10% discount if sub total > 2000
  bool get isEligibleForDiscount => subtotal > 2000;
  /// sub total after discount
  double get discountAmount {
    if(isEligibleForDiscount){
      return subtotal * 0.10;
    }
    return 0.0;
  }

  double get finalTotal => subtotal - discountAmount;

   bool isInCart(String productId){
    return _items.containsKey(productId);
  }

  /// add to cart
  void addToCart(ProductModel product){
     if(_items.containsKey(product.id)){
       _items[product.id]!.quantity +=1;
     }
     else {
       _items[product.id] = CartItem(product: product);
     }
     notifyListeners();
  }

  /// IncrementQuantity
  void incrementQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity += 1;
      notifyListeners();
    }
  }

  /// decrement quantity
  void decrementQuantity(String productId) {
    if (!_items.containsKey(productId)) return;

    if (_items[productId]!.quantity > 1) {
      _items[productId]!.quantity -= 1;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  /// remove item
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  /// clear cart item
  void clearCart() {
    _items.clear();
    notifyListeners();
  }




}