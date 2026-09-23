import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/app_card.dart';
import '../widgets/app_text_field.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2EC),
      appBar: AppBar(
        title: const Text('Loom', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 28),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
                  },
                ),
                Consumer<CartProvider>(
                  builder: (context, cart, child) {
                    if (cart.totalItemCount == 0) return const SizedBox();
                    return Positioned(
                      right: 4,
                      top: 4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFC7861A),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${cart.totalItemCount}',
                          style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              hintText: 'Search products',
              onChanged: (value) => context.read<ProductProvider>().setSearchQuery(value),
            ),
            const SizedBox(height: 12),
            // Category Filter Chips
            Consumer<ProductProvider>(
              builder: (context, productProv, _) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: productProv.categories.map((cat) {
                      final isSelected = productProv.selectedCategory == cat;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Text(cat),
                          selected: isSelected,
                          selectedColor: const Color(0xFF132420),
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          onSelected: (_) => productProv.setCategory(cat),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            const Text('FEATURED PRODUCTS',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
            const SizedBox(height: 8),
            // Grid View of Products
            Expanded(
              child: Consumer2<ProductProvider, CartProvider>(
                builder: (context, productProv, cartProv, _) {
                  final products = productProv.filteredProducts;
                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.63,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final isInCart = cartProv.isInCart(product.id);

                      return AppCard(
                        title: product.name,
                        price: product.price,
                        imagePath: product.imagePath,
                        isAdded: isInCart,
                        onAddToCart: () {
                          if (isInCart) {
                            cartProv.removeItem(product.id);
                          } else {
                            cartProv.addToCart(product);
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}