import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier{
  final List<ProductModel> _products = [
    ProductModel(
      id: '1',
      name: 'Wireless Mouse',
      price: 850,
      category: 'Audio',
      imagePath: 'assets/product/wireless_mouse.jpg',
    ),
    ProductModel(
      id: '2',
      name: 'Wireless Speaker',
      price: 1600,
      category: 'Audio',
      imagePath: 'assets/product/wireless_speaker.jpg',
    ),
    ProductModel(
      id: '3',
      name: 'Cotton T-Shirt',
      price: 600,
      category: 'Apparel',
      imagePath: 'assets/product/t_shirt.jpg',
    ),
    ProductModel(
      id: '4',
      name: 'Running Shoes',
      price: 2400,
      category: 'Apparel',
      imagePath: 'assets/product/shoes.jpg',
    ),
    ProductModel(
      id: '5',
      name: 'Ceramic Mug',
      price: 350,
      category: 'Home',
      imagePath: 'assets/product/mug.jpg',
    ),
    ProductModel(
      id: '6',
      name: 'Backpack',
      price: 1900,
      category: 'Bags',
      imagePath: 'assets/product/beg.jpg',
    ),
    ProductModel(
      id: '7',
      name: 'Wireless Headphones',
      price: 1450,
      category: 'Audio',
      imagePath: 'assets/product/wireless_headphones.jpg',
    ),
    ProductModel(
      id: '8',
      name: 'Table Lamp',
      price: 1100,
      category: 'Home',
      imagePath: 'assets/product/table_lamp.jpg',
    ),
    ProductModel(
      id: '9',
      name: 'Travel Bag',
      price: 2800,
      category: 'Bags',
      imagePath: 'assets/product/travel_beg.jpg',
    ),
    ProductModel(
      id: '10',
      name: 'Sunglass',
      price: 1200,
      category: 'Apparel',
      imagePath: 'assets/product/sunglass.jpg',
    ),
    ProductModel(
      id: '11',
      name: 'Leather Wallet',
      price: 950,
      category: 'Apparel',
      imagePath: 'assets/product/wallet.jpg',
    ),
    ProductModel(
      id: '12',
      name: 'Smart Watch',
      price: 3200,
      category: 'Electronics',
      imagePath: 'assets/product/watch.jpg',
    ),
  ];

  String _searchQuery = '';
  String _selectedCategory = 'All';

  String get selectedCategory =>_selectedCategory;

  List<String> get categories => ['All', 'Audio', 'Apparel','Home','Bags'];

  List<ProductModel> get filteredProducts {
    return _products.where((product){
      final matchesCategory = _selectedCategory == 'All' || product.category == _selectedCategory;
      final matchesSearch = product.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void setSearchQuery(String query){
    _searchQuery = query;
    notifyListeners();
  }

  void setCategory(String category){
    _selectedCategory = category;
    notifyListeners();
  }
}