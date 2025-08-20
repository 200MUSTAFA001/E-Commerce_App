// Flutter imports:
// Project imports:
import 'package:api_app/app_router.dart';
import 'package:api_app/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer_item.dart';

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
            onTap: () {},
          ),
          const SizedBox(
            height: 6,
          ),
          const DrawerItem(
            itemIcon: CupertinoIcons.square_grid_2x2,
            itemTitle: "Categories",
            itemPageName: AppRouter.categoriesPage,
          ),
          const DrawerItem(
            itemIcon: CupertinoIcons.heart,
            itemTitle: "Wishlist",
            itemPageName: AppRouter.wishlistPage,
          ),
          const DrawerItem(
            itemIcon: CupertinoIcons.cart,
            itemTitle: "Cart",
            itemPageName: AppRouter.cartPage,
          ),
          const DrawerItem(
            itemIcon: CupertinoIcons.info,
            itemTitle: "about us",
            itemPageName: AppRouter.cartPage,
          ),
          const DrawerItem(
            itemIcon: Icons.logout,
            itemTitle: "logout",
            itemPageName: AppRouter.cartPage,
          ),
        ],
      ).onlyPadding(top: 40),
    );
  }
}

/*

 // ListTile(
          //   leading: const Icon(
          //     CupertinoIcons.square_grid_2x2,
          //     size: 30,
          //   ),
          //   title: const Text(
          //     'Shop by Categories',
          //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          //   ),
          //   onTap: () {
          //     context.push(AppRouter.categoriesPage);
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(
          //     CupertinoIcons.cart,
          //     size: 30,
          //   ),
          //   title: const Text(
          //     'Cart',
          //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          //   ),
          //   onTap: () {
          //     context.push(AppRouter.cartPage);
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(
          //     CupertinoIcons.heart,
          //     size: 30,
          //   ),
          //   title: const Text(
          //     'Favorites',
          //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          //   ),
          //   onTap: () {
          //     context.push(AppRouter.wishlistPage);
          //   },
          // ),

*/
