import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final IconData prefixIcon;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.prefixIcon = Icons.search,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          prefixIcon: Icon(prefixIcon, color: Colors.grey.shade600, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
