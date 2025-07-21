import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/services/web_services.dart';
import 'package:api_app/logic/cubit/all_products_cubit.dart';
import 'package:api_app/logic/cubit/limited_products_cubit.dart';
import 'package:api_app/presentation/screens/all_categories_page.dart';
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
  //
  late ProductsRepo productsRepo;
  late AllProductsCubit allProductsCubit;
  late LimitedProductsCubit limitedProductsCubit;

  AppRouter() {
    productsRepo =
        ProductsRepo(GetLimitedProductsService(), GetAllProductsService());
    allProductsCubit = AllProductsCubit(productsRepo);
    limitedProductsCubit = LimitedProductsCubit(productsRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => limitedProductsCubit,
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
            create: (context) => AllProductsCubit(productsRepo),
            child: ProductsOnSalePage(
              categories: categories,
            ),
          ),
        );
      case productsByCategoryPage:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AllProductsCubit(productsRepo),
            child: ProductsByCategoryPage(
              category: category,
            ),
          ),
        );
      default:
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
