import 'package:dartx/dartx.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/presentation/widgets/categories_page_custom_widgets/products_by_category_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_router.dart';

class CustomSliverAppBar extends StatefulWidget {
  CustomSliverAppBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.isClicked,
    required this.categoryTitle,
  });

  bool isClicked;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String categoryTitle;

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    switch (widget.isClicked) {
      case false:
        return SliverAppBar(
          elevation: 0,
          pinned: true,
          toolbarHeight: context.height * 0.1,
          title: Text(
            widget.categoryTitle == "mens-shirts"
                ? "Shirts"
                : widget.categoryTitle.capitalize(),
            style: GoogleFonts.oswald(fontSize: 22, letterSpacing: 1),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.isClicked = true;
                  });
                },
                icon: const Icon(CupertinoIcons.search)),
            IconButton(
              onPressed: () {
                context.push(AppRouter.cartPage);
              },
              icon: const Icon(Icons.shopping_bag_outlined),
              color: Colors.deepOrangeAccent,
            ),
          ],
        );
      case true:
        return SliverAppBar(
          elevation: 0,
          pinned: true,
          leading: IconButton(
              onPressed: () {
                setState(() {
                  widget.isClicked = false;
                });
              },
              icon: const Icon(CupertinoIcons.back)),
          toolbarHeight: context.height * 0.1,
          title: ProductsByCategorySearchBar(
            controller: widget.controller,
            onChanged: widget.onChanged,
          ),
        );
    }
  }
}
