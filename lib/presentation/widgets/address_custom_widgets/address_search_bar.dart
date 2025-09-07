import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressSearchBar extends StatelessWidget {
  const AddressSearchBar(
      {super.key, required this.searchController, required this.onChanged});

  final TextEditingController searchController;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SearchBar(
        elevation: const WidgetStatePropertyAll(0),
        controller: searchController,
        leading: const Icon(CupertinoIcons.search),
        onChanged: onChanged,
      ).allPadding(12),
    );
  }
}
