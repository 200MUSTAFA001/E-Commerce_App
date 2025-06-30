import 'dart:developer';

import 'package:api_app/data/repository/categories_repo.dart';
import 'package:api_app/data/repository/products_repo.dart';
import 'package:api_app/data/services/store_web_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final service = CategoriesRepo(CategoryService());
              final result = await service.getAllCategories();
              if (result != null) {
                log("$result");
              }
            },
            child: Text("data"),
          ),
          ElevatedButton(
            onPressed: () async {
              final service = ProductsRepo(ProductService());
              final result = await service.getProductsByCategory("mobile");
              if (result != null) {
                final products = result.map((value) => value.title).toList();
                log("$products");
              }
            },
            child: Text("data"),
          )
        ],
      ),
    );
  }
}
