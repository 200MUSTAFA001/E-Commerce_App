import 'package:flutter/material.dart';

class ProfilePageItem extends StatelessWidget {
  const ProfilePageItem({
    super.key,
    required this.itemIcon,
    required this.itemName,
    required this.onTap,
  });

  final IconData itemIcon;
  final String itemName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        onTap: onTap,
        leading: Icon(itemIcon),
        title: Text(
          itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
