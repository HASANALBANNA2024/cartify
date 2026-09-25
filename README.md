# Cartify - Product Cart App (Flutter Provider)

![Flutter](https://img.shields.io/badge/FLUTTER-blue?style=flat-square&logo=flutter)
![Dart](https://img.shields.io/badge/DART-blue?style=flat-square&logo=dart)
![Provider](https://img.shields.io/badge/PROVIDER-6.1.5-blue?style=flat-square)

A clean and responsive Flutter application demonstrating state management using the **Provider** package without any external database or backend services.

## Features

- **Product Showcase:** Displays local products with images, names, prices, and category badges.
- **Search & Category Filter:** Dynamic searching and category-based filtering managed via `ProductProvider`.
- **Cart Management:** Add items, adjust quantities, or remove items with automatic real-time calculation.
- **Cart Summary & Discount:** Interactive checkout summary showing total items, subtotal, 10% discount (for subtotals over ৳2000), and final total.
- **Empty Cart View:** Responsive UI informing users when the cart is empty with a quick navigation button back to products.
- **Custom Splash Screen:** Minimalist startup screen with smooth navigation.

## State Management

Built strictly using **Provider** with `ChangeNotifier`:
- `ProductProvider`: Manages product list, search queries, and category selection.
- `CartProvider`: Manages cart items, quantity modification, and dynamic total calculations.

## Getting Started

1. Clone or download the repository.
2. Run `flutter pub get` in the terminal to fetch dependencies.
3. Run `flutter run` on an emulator or physical device.