import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'cart_provider.dart';
import 'product_provider.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ];
}