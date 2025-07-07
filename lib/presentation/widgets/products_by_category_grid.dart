import 'package:api_app/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/platzi_Product.dart';
import '../../data/models/product_model.dart';

class ProductsByCategoryGrid extends StatelessWidget {
  ProductsByCategoryGrid({
    super.key,
    required this.fakeStoreProducts,
    required this.platziProducts,
  });

  final List<Product> fakeStoreProducts;
  final List<PlatziProduct> platziProducts;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: fakeStoreProducts.isEmpty
          ? platziProducts.length
          : fakeStoreProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 0,
        childAspectRatio: 6 / 7.5,
      ),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: ProductCard(
          productName: fakeStoreProducts.isEmpty
              ? platziProducts[index].title
              : fakeStoreProducts[index].title,
          productImage: fakeStoreProducts.isEmpty
              ? (platziProducts[index].images.isEmpty
                  ? ""
                  : platziProducts[index].images.first)
              : fakeStoreProducts[index].image,
          productPrice: fakeStoreProducts.isEmpty
              ? platziProducts[index].price.toDouble()
              : fakeStoreProducts[index].price.toDouble(),
        ),
      ),
    );
  }
}
