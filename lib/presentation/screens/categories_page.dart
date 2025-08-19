// Flutter imports:
import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';

import '../widgets/categories_page_custom_widgets/categories_by_section.dart';
import '../widgets/categories_page_custom_widgets/sections_list.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Categories"),
            toolbarHeight: context.height * 0.1,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: context.width * 1,
              height: context.height * 0.12,
              child: SectionsList(selectedIndex: (value) {
                setState(() {
                  selectedIndex = value;
                });
              }),
            ),
          ),
          CategoriesBySection(selectedIndex: selectedIndex),
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.height * 0.1,
            ),
          )
        ],
      ),
    );
  }
}
