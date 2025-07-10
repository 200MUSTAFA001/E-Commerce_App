import 'package:api_app/data/repository/categories_repo.dart';
import 'package:api_app/data/services/web_services.dart';
import 'package:api_app/logic/cubit/all_products_cubit.dart';
import 'package:api_app/logic/cubit/categories_cubit.dart';
import 'package:api_app/logic/cubit/limited_products_cubit.dart';
import 'package:api_app/presentation/screens/all_categories.dart';
import 'package:api_app/presentation/screens/all_products_page.dart';
import 'package:api_app/presentation/screens/home_page.dart';
import 'package:api_app/presentation/screens/product_page.dart';
import 'package:api_app/presentation/screens/products_on_sale_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repository/products_repo.dart';

class AppRouter {
  late CategoriesRepo categoriesRepo;
  late CategoriesCubit categoriesCubit;
  //
  late ProductsRepo productsRepo;
  late AllProductsCubit allProductsCubit;
  late LimitedProductsCubit limitedProductsCubit;

  AppRouter() {
    categoriesRepo = CategoriesRepo(GetCategoriesService());
    categoriesCubit = CategoriesCubit(categoriesRepo);
    //
    productsRepo =
        ProductsRepo(GetLimitedProductsService(), GetAllProductsService());
    allProductsCubit = AllProductsCubit(productsRepo);
    limitedProductsCubit = LimitedProductsCubit(productsRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (BuildContext context) => categoriesCubit),
              BlocProvider(
                  create: (BuildContext context) => limitedProductsCubit),
            ],
            child: const HomePage(),
          ),
        );
      case "/allProducts":
        return MaterialPageRoute(
          builder: (_) => const AllProductsPage(),
        );
      case "/productDetails":
        return MaterialPageRoute(
          builder: (_) => const ProductPage(),
        );
      case "/AllCategories":
        return MaterialPageRoute(
          builder: (_) => const AllCategories(),
        );
      case "/ProductsOnSalePage":
        final args = settings.arguments as List<String>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AllProductsCubit(productsRepo),
            child: ProductsOnSalePage(
              categories: args,
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
