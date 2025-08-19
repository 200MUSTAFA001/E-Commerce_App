// Flutter imports:

import 'package:api_app/data/repository/products_repo.dart';
import 'package:api_app/data/services/web_services.dart';
import 'package:api_app/logic/cubit/products_cubit.dart';
import 'package:api_app/presentation/screens/cart/cart_page.dart';
import 'package:api_app/presentation/screens/home_page.dart';
import 'package:api_app/presentation/screens/settings_page.dart';
import 'package:api_app/presentation/screens/wishlist/wishlist_page.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/custom_widgets/custom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> bottomNavigationBarPages = [
    BlocProvider(
      create: (_) => ProductsCubit(ProductsRepo(GetProductsService())),
      child: const HomePage(),
    ),
    const CartPage(),
    const WishlistPage(),
    const SettingsPage(),
  ];

  final List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: "home",
        activeIcon: Icon(
          Icons.home_filled,
        )),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.cartShopping),
      label: "cart",
      activeIcon: Icon(
        FontAwesomeIcons.cartShopping,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.heart),
      label: "wishList",
      activeIcon: Icon(
        CupertinoIcons.heart_fill,
      ),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "settings",
      activeIcon: Icon(
        Icons.settings,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: currentIndex,
        children: bottomNavigationBarPages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        bottomNavigationBarItems: bottomNavigationBarItems,
      ),
    );
  }
}
