import 'package:api_app/data/repository/categories_repo.dart';
import 'package:api_app/data/repository/platzi_repo.dart';
import 'package:api_app/data/services/platzi_store_web_service.dart';
import 'package:api_app/logic/cubit/categories_cubit.dart';
import 'package:api_app/logic/cubit/fake_store_products_cubit.dart';
import 'package:api_app/logic/cubit/platzi_products_cubit.dart';
import 'package:api_app/presentation/screens/all_products_page.dart';
import 'package:api_app/presentation/screens/home_page.dart';
import 'package:api_app/presentation/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repository/products_repo.dart';
import 'data/services/fake_store_web_service.dart';

class AppRouter {
  late CategoriesRepo categoriesRepo;
  late CategoriesCubit categoriesCubit;
  //
  late ProductsRepo productsRepo;
  late ProductsCubit productsCubit;
  //
  late PlatziRepo platziRepo;
  late PlatziProductsCubit platziProductsCubit;

  AppRouter() {
    categoriesRepo = CategoriesRepo(CategoryService());
    categoriesCubit = CategoriesCubit(categoriesRepo);
    //
    productsRepo = ProductsRepo(ProductService());
    productsCubit = ProductsCubit(productsRepo);
    //
    platziRepo = PlatziRepo(PlatziService());
    platziProductsCubit = PlatziProductsCubit(platziRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              // BlocProvider<ProductsCubit>.value(value: productsCubit),
              // BlocProvider<PlatziProductsCubit>.value(value: platziProductsCubit),
              BlocProvider(
                  create: (BuildContext context) => platziProductsCubit),
              BlocProvider(create: (BuildContext context) => productsCubit),
            ],
            child: HomePage(),
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
      default:
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
