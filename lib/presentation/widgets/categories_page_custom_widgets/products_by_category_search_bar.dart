import 'package:flutter/material.dart';

class ProductsByCategorySearchBar extends StatelessWidget {
  const ProductsByCategorySearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      textInputAction: TextInputAction.search,
      leading: const Icon(Icons.search),
      padding: const WidgetStatePropertyAll(EdgeInsets.only(left: 16)),
      backgroundColor: const WidgetStatePropertyAll(Colors.black12),
      autoFocus: true,
      hintText: "Search",
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      elevation: const WidgetStatePropertyAll(0),
      controller: controller,
      onChanged: onChanged,
    );
  }
}
