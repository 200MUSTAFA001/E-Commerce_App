// Package imports:
// Project imports:
import 'package:e_commerce_app/data/models/address_model.dart';
import 'package:e_commerce_app/data/models/category_item_model.dart';
import 'package:e_commerce_app/data/repository/address_repo.dart';
import 'package:e_commerce_app/data/repository/products_repo.dart';
import 'package:e_commerce_app/data/services/address_service.dart';
import 'package:e_commerce_app/data/services/products_service.dart';
import 'package:e_commerce_app/logic/cubit/address_cubit.dart';
import 'package:e_commerce_app/logic/cubit/address_service_cubit.dart';
import 'package:e_commerce_app/logic/cubit/search_cubit.dart';
import 'package:e_commerce_app/presentation/screens/cart/cart_page.dart';
import 'package:e_commerce_app/presentation/screens/categories_page.dart';
import 'package:e_commerce_app/presentation/screens/help_and_support_page.dart';
import 'package:e_commerce_app/presentation/screens/main_page.dart';
import 'package:e_commerce_app/presentation/screens/product_page/product_details_page.dart';
import 'package:e_commerce_app/presentation/screens/product_page/product_image_Interactive_viewer.dart';
import 'package:e_commerce_app/presentation/screens/products_by_category_page.dart';
import 'package:e_commerce_app/presentation/screens/products_on_sale_page.dart';
import 'package:e_commerce_app/presentation/screens/search/search_page.dart';
import 'package:e_commerce_app/presentation/screens/user_addresses/add_new_address_page.dart';
import 'package:e_commerce_app/presentation/screens/user_addresses/edit_address_page.dart';
import 'package:e_commerce_app/presentation/screens/user_addresses/user_addresses_page.dart';
import 'package:e_commerce_app/presentation/screens/wishlist/wishlist_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'data/models/products_model.dart';
import 'logic/cubit/products_cubit.dart';

class AppRouter {
  static const String homePage = "/";
  static const String productDetailsPage = "/productDetailsPage";
  static const String categoriesPage = "/categoriesPage";
  static const String productsOnSalePage = "/productsOnSalePage";
  static const String productsByCategoryPage = "/productsByCategoryPage";
  static const String cartPage = "/cartPage";
  static const String wishlistPage = "/wishlistPage";
  static const String productImageInteractiveViewer =
      "/productImageInteractiveViewer";
  static const String searchPage = "/searchPage";
  //
  static const String userAddressesPage = "/userAddressesPage";
  static const String addNewAddressPage = "/addNewAddressPage";
  static const String editAddressPage = "/editAddressPage";
  static const String helpAndSupportPage = "/helpAndSupportPage";

  //
  //
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: homePage, builder: (context, state) => const MainPage()),
      GoRoute(
          path: productDetailsPage,
          builder: (context, state) {
            final product = state.extra as Product;
            return BlocProvider(
              create: (context) =>
                  ProductsCubit(ProductsRepo(GetProductsService())),
              child: ProductDetailsPage(product: product),
            );
          }),
      GoRoute(
          path: categoriesPage,
          builder: (context, state) => const CategoriesPage()),
      GoRoute(
          path: productsOnSalePage,
          builder: (context, state) {
            final categories = state.extra as List<Map<String, dynamic>>;

            return BlocProvider(
              create: (context) =>
                  ProductsCubit(ProductsRepo(GetProductsService())),
              child: ProductsOnSalePage(categories: categories),
            );
          }),
      GoRoute(
          path: productsByCategoryPage,
          builder: (context, state) {
            final category = state.extra as CategoryItem;
            return BlocProvider(
              create: (context) =>
                  ProductsCubit(ProductsRepo(GetProductsService())),
              child: ProductsByCategoryPage(category: category),
            );
          }),
      GoRoute(
        path: cartPage,
        builder: (context, state) => BlocProvider(
          create: (context) => AddressCubit(),
          child: const CartPage(),
        ),
      ),
      GoRoute(
          path: wishlistPage,
          builder: (context, state) => const WishlistPage()),
      GoRoute(
          path: productImageInteractiveViewer,
          builder: (context, state) {
            final productImage = state.extra as String;
            return ProductImageInteractiveViewer(productImage: productImage);
          }),
      GoRoute(
        path: searchPage,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(),
          child: const SearchPage(),
        ),
      ),
      GoRoute(
        path: userAddressesPage,
        builder: (context, state) => BlocProvider(
          create: (context) => AddressCubit(),
          child: const UserAddressesPage(),
        ),
      ),
      GoRoute(
        path: addNewAddressPage,
        builder: (context, state) {
          final cubit = state.extra as AddressCubit;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    AddressServiceCubit(AddressRepo(AddressService())),
              ),
              BlocProvider(create: (context) => AddressCubit()),
            ],
            child: AddNewAddressPage(cubit: cubit),
          );
        },
      ),
      GoRoute(
        path: editAddressPage,
        builder: (context, state) {
          final address = state.extra as AddressModel;

          return BlocProvider(
            create: (context) => AddressCubit(),
            child: EditAddressPage(address: address),
          );
        },
      ),
      GoRoute(
        path: helpAndSupportPage,
        builder: (context, state) => HelpAndSupportPage(),
      ),
    ],
  );
}
