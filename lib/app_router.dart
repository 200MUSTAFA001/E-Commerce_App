// Package imports:
// Project imports:
import 'package:e_commerce_app/data/models/address_model.dart';
import 'package:e_commerce_app/data/models/category_item_model.dart';
import 'package:e_commerce_app/data/models/checkout_details_model.dart';
import 'package:e_commerce_app/data/models/order_model.dart';
import 'package:e_commerce_app/data/repository/address_repo.dart';
import 'package:e_commerce_app/data/repository/products_repo.dart';
import 'package:e_commerce_app/data/services/address_service.dart';
import 'package:e_commerce_app/data/services/products_service.dart';
import 'package:e_commerce_app/logic/cubit/address_cubit.dart';
import 'package:e_commerce_app/logic/cubit/address_service_cubit.dart';
import 'package:e_commerce_app/logic/cubit/hydrated_cubits/orders_cubit.dart';
import 'package:e_commerce_app/logic/cubit/search_cubit.dart';
import 'package:e_commerce_app/presentation/screens/cart/cart_page.dart';
import 'package:e_commerce_app/presentation/screens/categories_page.dart';
import 'package:e_commerce_app/presentation/screens/checkout_page.dart';
import 'package:e_commerce_app/presentation/screens/main_page.dart';
import 'package:e_commerce_app/presentation/screens/orders/order_details_page.dart';
import 'package:e_commerce_app/presentation/screens/orders/orders_page.dart';
import 'package:e_commerce_app/presentation/screens/others_pages/help_and_support_page.dart';
import 'package:e_commerce_app/presentation/screens/others_pages/products_on_sale_page.dart';
import 'package:e_commerce_app/presentation/screens/others_pages/settings_page.dart';
import 'package:e_commerce_app/presentation/screens/product_page/product_details_page.dart';
import 'package:e_commerce_app/presentation/screens/product_page/product_image_Interactive_viewer.dart';
import 'package:e_commerce_app/presentation/screens/products_by_category_page.dart';
import 'package:e_commerce_app/presentation/screens/profile_page.dart';
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
  static const String profilePage = "/profilePage";
  static const String settingsPage = "/settingsPage";
  static const String checkOutPage = "/checkOutPage";
  static const String ordersPage = "/ordersPage";
  static const String orderDetailsPage = "/orderDetailsPage";

  //
  final GoRouter router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) => BlocProvider(
          create: (_) => AddressCubit(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: cartPage,
            builder: (context, state) => const CartPage(),
          ),
          GoRoute(
            path: userAddressesPage,
            builder: (context, state) => const UserAddressesPage(),
          ),
          GoRoute(
            path: addNewAddressPage,
            builder: (context, state) {
              return BlocProvider(
                create: (context) =>
                    AddressServiceCubit(AddressRepo(AddressService())),
                child: const AddNewAddressPage(),
              );
            },
          ),
          GoRoute(
            path: editAddressPage,
            builder: (context, state) {
              final address = state.extra as AddressModel;

              return EditAddressPage(address: address);
            },
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) => BlocProvider(
          create: (_) => OrdersCubit(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: checkOutPage,
            builder: (context, state) {
              final checkoutDetails = state.extra as CheckoutDetailsModel;
              return CheckoutPage(checkoutDetails: checkoutDetails);
            },
          ),
          GoRoute(
            path: ordersPage,
            builder: (context, state) => const OrdersPage(),
          ),
          GoRoute(
            path: orderDetailsPage,
            builder: (context, state) {
              final orderItem = state.extra as OrderItemModel;
              return OrderDetailsPage(orderItem: orderItem);
            },
          ),
        ],
      ),
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
        path: helpAndSupportPage,
        builder: (context, state) => const HelpAndSupportPage(),
      ),
      GoRoute(
        path: profilePage,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: settingsPage,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
