import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../widgets/app_button.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2EC),
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, _) {
          // Empty Cart View
          if (cart.items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF3E4C6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_basket_outlined,
                        size: 40,
                        color: Color(0xFFC7861A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Cart is empty',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Items you add will show up here, with live totals and quantity controls.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    AppButton(
                      text: 'Browse products',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            );
          }

          // Filled Cart View
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items.values.toList()[index];
                    return CartItemTile(
                      cartItem: item,
                      onIncrement: () =>
                          cart.incrementQuantity(item.product.id),
                      onDecrement: () =>
                          cart.decrementQuantity(item.product.id),
                      onRemove: () => cart.removeItem(item.product.id),
                    );
                  },
                ),
                const SizedBox(height: 12),
                // Summary Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.black.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Column(
                    children: [
                      _summaryRow('Total items', '${cart.totalItemCount}'),
                      _summaryRow(
                        'Subtotal',
                        '৳${cart.subtotal.toStringAsFixed(0)}',
                      ),
                      _summaryRow(
                        'Discount ${cart.isEligibleForDiscount ? "(10%)" : "(needs >৳2000)"}',
                        '${cart.isEligibleForDiscount ? "-" : ""}৳${cart.discountAmount.toStringAsFixed(0)}',
                        textColor: const Color(0xFF3E7A4C),
                      ),
                      const Divider(),
                      _summaryRow(
                        'Final total',
                        '৳${cart.finalTotal.toStringAsFixed(0)}',
                        isTotal: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                AppButton(
                  text: 'Checkout',
                  icon: Icons.lock_outline,
                  onPressed: () {},
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    text: 'Clear cart',
                    isOutlined: true,
                    onPressed: () => cart.clearCart(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value, {
    Color? textColor,
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: textColor ?? Colors.grey.shade700,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
              fontSize: isTotal ? 18 : 14,
              color: isTotal ? const Color(0xFFC7861A) : textColor,
            ),
          ),
        ],
      ),
    );
  }
}
