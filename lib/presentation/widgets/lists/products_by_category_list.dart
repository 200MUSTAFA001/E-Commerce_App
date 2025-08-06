import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/presentation/widgets/cards/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryList extends StatelessWidget {
  const ProductsByCategoryList({
    super.key,
    required this.products,
    required this.itemCount,
  });

  final List<Product> products;

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 0,
        childAspectRatio: 6 / 9,
      ),
      itemBuilder: (context, index) => ProductCard(
        product: products[index],
      ),
    );
  }
}
