import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Drawer CustomDrawer(BuildContext context) {
  return Drawer(
    width: MediaQuery.of(context).size.width * 0.6,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue.shade900,
          ),
          child: const Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.cart),
          title: const Text('Cart'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.person),
          title: const Text('Profile'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
