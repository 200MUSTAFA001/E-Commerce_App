// Flutter imports:
// Project imports:
import 'package:api_app/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key,
      required this.controller,
      required this.onChanged,
      required this.onPressed});

  final TextEditingController controller;
  final void Function(String) onChanged;
  final void Function() onPressed;

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
              onTapOutside: (PointerDownEvent event) {
                FocusManager.instance.primaryFocus
                    ?.unfocus(); // for unfocus the keyboard
              },
              trailing: [
                IconButton(
                    onPressed: onPressed, icon: Icon(Icons.highlight_off))
              ],
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
