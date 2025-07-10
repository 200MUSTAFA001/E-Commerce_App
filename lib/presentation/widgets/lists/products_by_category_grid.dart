import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/presentation/widgets/cards/product_card.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryGrid extends StatelessWidget {
  const ProductsByCategoryGrid({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 0,
        childAspectRatio: 6 / 7.5,
      ),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: ProductCard(
          productName: products[index].title,
          productImage: products[index].images.first,
          productPrice: products[index].price.toDouble(),
        ),
      ),
    );
  }
}

// class FakeStoreProductsByCategoryGrid extends StatelessWidget {
//   const FakeStoreProductsByCategoryGrid({
//     super.key,
//     required this.products,
//   });
//
//   final List<Product> products;
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverGrid.builder(
//       itemCount: products.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisSpacing: 16,
//         crossAxisSpacing: 0,
//         childAspectRatio: 6 / 7.5,
//       ),
//       itemBuilder: (BuildContext context, int index) => Padding(
//         padding: const EdgeInsets.only(right: 10, left: 10),
//         child: ProductCard(
//             productName: products[index].title,
//             productImage: products[index].image,
//             productPrice: products[index].price.toDouble()),
//       ),
//     );
//   }
// }
