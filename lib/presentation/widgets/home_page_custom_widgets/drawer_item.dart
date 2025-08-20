import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.itemIcon,
    required this.itemTitle,
    required this.itemPageName,
  });

  final IconData itemIcon;
  final String itemTitle;
  final String itemPageName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        itemIcon,
        size: 30,
      ),
      title: Text(
        itemTitle,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      onTap: () {
        context.push(itemPageName);
      },
    );
  }
}
