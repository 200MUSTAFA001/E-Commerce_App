// Flutter imports:
// Project imports:
import 'package:api_app/app_router.dart';
import 'package:api_app/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          ListTile(
            leading: Image.asset("assets/mock_pics/user_pic.png"),
            title: const Text(
              "Emy Adams",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            subtitle: const Text("+01-23456789"),
            trailing: const Icon(CupertinoIcons.forward),
          ),
          const SizedBox(
            height: 6,
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.square_grid_2x2,
              size: 30,
            ),
            title: const Text(
              'Shop by Categories',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            onTap: () {
              context.push(AppRouter.categoriesPage);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.cart,
              size: 30,
            ),
            title: const Text(
              'Cart',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            onTap: () {
              context.push(AppRouter.cartPage);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.heart,
              size: 30,
            ),
            title: const Text(
              'Favorites',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            onTap: () {
              context.push(AppRouter.wishlistPage);
            },
          ),
        ],
      ).onlyPadding(top: 40),
    );
  }
}
