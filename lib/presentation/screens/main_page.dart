import 'package:api_app/data/repository/products_repo.dart';
import 'package:api_app/data/services/web_services.dart';
import 'package:api_app/logic/cubit/products_cubit.dart';
import 'package:api_app/presentation/screens/cart/cart_page.dart';
import 'package:api_app/presentation/screens/favorites/favorites_page.dart';
import 'package:api_app/presentation/screens/home_page.dart';
import 'package:api_app/presentation/screens/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> bottomNavigationBarPages = [
    BlocProvider(
      create: (_) => ProductsCubit(
        ProductsRepo(
          GetProductsService(),
        ),
      ),
      child: const HomePage(),
    ),
    const CartPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: bottomNavigationBarPages,
        ),
        bottomNavigationBar: SnakeNavigationBar.color(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.rectangle,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          // padding: const EdgeInsets.only(left: 16, right: 16),
          snakeViewColor: Colors.deepOrangeAccent,
          unselectedItemColor: Colors.black,
          selectedLabelStyle:
              const TextStyle(fontSize: 14, color: Colors.black),
          unselectedLabelStyle:
              const TextStyle(fontSize: 10, color: Colors.black),
          items: const [
            BottomNavigationBarItem(
                // tooltip: "home",
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
          ],
        )
        // BottomNavigationBar(
        //   currentIndex: currentIndex,
        //   onTap: (index) => setState(() => currentIndex = index),
        //   // selectedItemColor: Colors.deepOrangeAccent,
        //   unselectedItemColor: Colors.black,
        //   items: const [
        //     BottomNavigationBarItem(
        //         tooltip: "home",
        //         icon: Icon(Icons.home_filled),
        //         label: "home",
        //         activeIcon: Icon(
        //           Icons.home_filled,
        //           color: Colors.deepOrangeAccent,
        //         )),
        //     BottomNavigationBarItem(
        //       icon: Icon(FontAwesomeIcons.cartShopping),
        //       label: "cart",
        //       activeIcon: Icon(
        //         FontAwesomeIcons.cartShopping,
        //         color: Colors.greenAccent,
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(CupertinoIcons.heart),
        //       label: "wishList",
        //       activeIcon: Icon(
        //         CupertinoIcons.heart_fill,
        //         color: Colors.red,
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.settings),
        //       label: "settings",
        //       activeIcon: Icon(
        //         Icons.settings,
        //         color: Colors.blueAccent,
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
