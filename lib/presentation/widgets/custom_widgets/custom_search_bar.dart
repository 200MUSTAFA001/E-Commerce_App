// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:api_app/extensions.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      toolbarHeight: context.height * 0.1,
      pinned: true,
      backgroundColor: Colors.transparent,
      actions: [
        Hero(
          tag: "searchBarTag",
          child: SizedBox(
            width: context.width * 0.9,
            child: SearchBar(
              onChanged: onChanged,
              autoFocus: true,
              padding: const WidgetStatePropertyAll(EdgeInsets.only(left: 14)),
              controller: controller,
              leading: const Icon(CupertinoIcons.search),
              hintText: "What are Looking for ?",
              elevation: const WidgetStatePropertyAll(0),
              textInputAction: TextInputAction.search,
            ).onlyPadding(right: 10, left: 10),
          ),
        ),
      ],
    );
  }
}
