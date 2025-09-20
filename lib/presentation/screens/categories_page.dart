// Flutter imports:
import 'package:e_commerce_app/extensions.dart';
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
            pinned: true,
            title: const Text("Categories"),
            toolbarHeight: context.height * 0.1,
            expandedHeight: context.height * 0.2,
            flexibleSpace: FlexibleSpaceBar(
              background: SectionsList(selectedIndex: (value) {
                setState(() {
                  selectedIndex = value;
                });
              }),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: SectionsList(selectedIndex: (value) {
          //     setState(() {
          //       selectedIndex = value;
          //     });
          //   }),
          // ),
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
