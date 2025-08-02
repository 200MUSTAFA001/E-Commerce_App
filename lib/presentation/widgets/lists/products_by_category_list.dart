import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/presentation/widgets/cards/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryList extends StatefulWidget {
  const ProductsByCategoryList({
    super.key,
    required this.products,
    required this.itemCount,
  });

  final List<Product> products;

  final int itemCount;

  @override
  State<ProductsByCategoryList> createState() => _ProductsByCategoryListState();
}

class _ProductsByCategoryListState extends State<ProductsByCategoryList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 0,
        childAspectRatio: 6 / 9,
      ),
      itemBuilder: (context, index) => ProductCard(
        isFavoriteIcon: isFavoriteIcon(widget.products[index].isFavorite),
        favoriteIconOnTap: () {
          setState(() {
            widget.products[index].isFavorite =
                !widget.products[index].isFavorite;
          });
        },
        product: widget.products[index],
      ),
    );
  }
}
