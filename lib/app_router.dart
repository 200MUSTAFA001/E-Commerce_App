import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/services/web_services.dart';
import 'package:api_app/logic/cubit/products_cubit.dart';
import 'package:api_app/presentation/screens/all_categories_page.dart';
import 'package:api_app/presentation/screens/cart_page.dart';
import 'package:api_app/presentation/screens/home_page.dart';
import 'package:api_app/presentation/screens/product_details_page.dart';
import 'package:api_app/presentation/screens/products_by_category_page.dart';
import 'package:api_app/presentation/screens/products_on_sale_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repository/products_repo.dart';

class AppRouter {
  static const String homePage = "/";
  static const String productDetailsPage = "/productDetailsPage";
  static const String allCategoriesPage = "/allCategoriesPage";
  static const String productsOnSalePage = "/productsOnSalePage";
  static const String productsByCategoryPage = "/productsByCategoryPage";
  static const String cartPage = "/cartPage";
  //
  late ProductsRepo productsRepo;
  late ProductsCubit productsCubit;

  AppRouter() {
    productsRepo = ProductsRepo(GetProductsService());
    productsCubit = ProductsCubit(productsRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => productsCubit,
            child: const HomePage(),
          ),
        );
      case productDetailsPage:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsPage(product: product),
        );
      case allCategoriesPage:
        return MaterialPageRoute(
          builder: (_) => const AllCategoriesPage(),
        );
      case productsOnSalePage:
        final categories = settings.arguments as List<String>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductsCubit(productsRepo),
            child: ProductsOnSalePage(
              categories: categories,
            ),
          ),
        );
      case productsByCategoryPage:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductsCubit(productsRepo),
            child: ProductsByCategoryPage(
              category: category,
            ),
          ),
        );
      case cartPage:
        return MaterialPageRoute(
          builder: (_) => CartPage(),
        );
      default:
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
