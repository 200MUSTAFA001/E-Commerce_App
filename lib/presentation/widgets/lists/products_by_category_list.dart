import 'package:api_app/app_router.dart';
import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/presentation/widgets/cards/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryList extends StatefulWidget {
  const ProductsByCategoryList({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  State<ProductsByCategoryList> createState() => _ProductsByCategoryListState();
}

class _ProductsByCategoryListState extends State<ProductsByCategoryList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 0,
        childAspectRatio: 6 / 9,
      ),
      itemBuilder: (BuildContext context, int index) => ProductCard(
        gestureOnTap: () {
          final arguments = widget.products[index];
          Navigator.pushNamed(context, AppRouter.productDetailsPage,
              arguments: arguments);
        },
        isFavoriteIcon: (widget.products[index].isFavorite)
            ? const Icon(
                CupertinoIcons.heart_fill,
                color: Colors.red,
              )
            : const Icon(CupertinoIcons.suit_heart),
        productName: widget.products[index].title,
        productPrice: widget.products[index].price.toDouble(),
        productImage: widget.products[index].thumbnail,
        productPriceDiscount: widget.products[index].discountPercentage,
        onTap: () {
          setState(() {
            widget.products[index].isFavorite =
                !widget.products[index].isFavorite;
          });
        },
        productRating: widget.products[index].rating,
      ),
    );
  }
}
