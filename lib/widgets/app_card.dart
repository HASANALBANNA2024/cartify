import 'package:flutter/material.dart';

import 'app_button.dart';

class AppCard extends StatelessWidget {
  final String title;
  final double price;
  final String imagePath;
  final VoidCallback onAddToCart;
  final bool isAdded;

  const AppCard({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
    required this.onAddToCart,
    this.isAdded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFEEF2EC),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 40,
                        color: Color(0xFF3D544D),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '৳${price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC7861A),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 36,
                  child: AppButton(
                    text: isAdded ? 'Added' : 'Add to cart',
                    icon: isAdded ? Icons.check : Icons.add,
                    backgroundColor: isAdded
                        ? const Color(0xFF3E7A4C)
                        : const Color(0xFF132420),
                    onPressed: onAddToCart,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
