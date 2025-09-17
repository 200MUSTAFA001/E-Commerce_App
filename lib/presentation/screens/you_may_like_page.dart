import 'package:e_commerce_app/data/models/products_model.dart';
import 'package:e_commerce_app/presentation/widgets/custom_widgets/products_by_category_list.dart';
import 'package:flutter/material.dart';

class YouMayLikePage extends StatelessWidget {
  const YouMayLikePage({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("You may like"),
            pinned: true,
          ),
          ProductsGrid(products: products, itemCount: products.length),
        ],
      ),
    );
  }
}
