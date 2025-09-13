// Flutter imports:

import 'package:e_commerce_app/data/repository/products_repo.dart';
import 'package:e_commerce_app/data/services/products_service.dart';
import 'package:e_commerce_app/logic/cubit/products_cubit.dart';
import 'package:e_commerce_app/presentation/screens/categories_page.dart';
import 'package:e_commerce_app/presentation/screens/home_page.dart';
import 'package:e_commerce_app/presentation/screens/others_pages/settings_page.dart';
import 'package:e_commerce_app/presentation/screens/wishlist/wishlist_page.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

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
    const CategoriesPage(),
    const WishlistPage(),
    const SettingsPage(),
  ];

  final List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: "home",
        activeIcon: Icon(Icons.home_filled)),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.square_grid_2x2),
      label: "categories",
      activeIcon: Icon(CupertinoIcons.square_grid_2x2),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.heart),
      label: "wishList",
      activeIcon: Icon(CupertinoIcons.heart_fill),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      label: "settings",
      activeIcon: Icon(Icons.settings),
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
