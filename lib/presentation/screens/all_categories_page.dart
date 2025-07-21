import 'package:api_app/presentation/widgets/lists/categories_grid.dart';
import 'package:flutter/material.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CategoriesGrid(),
    );
  }
}
