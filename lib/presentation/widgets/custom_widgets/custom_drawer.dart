import 'package:api_app/presentation/widgets/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
            },
          ),
        ],
      ).onlyPadding(right: 0, left: 0, top: 40, bottom: 0),
    );
  }
}
