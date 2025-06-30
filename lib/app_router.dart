import 'package:api_app/presentation/screens/all_products_page.dart';
import 'package:api_app/presentation/screens/home_page.dart';
import 'package:api_app/presentation/screens/product_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case "/allProducts":
        return MaterialPageRoute(
          builder: (_) => const AllProductsPage(),
        );
      case "/productDetails":
        return MaterialPageRoute(
          builder: (_) => const ProductPage(),
        );
      default:
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
