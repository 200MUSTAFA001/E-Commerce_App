import 'package:api_app/app_router.dart';
import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/logic/cubit/cart_cubit.dart';
import 'package:api_app/presentation/widgets/cards/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      itemBuilder: (BuildContext context, int index) => ProductCard(
        gestureOnTap: () {
          final arguments = widget.products[index];
          Navigator.pushNamed(
            context,
            AppRouter.productDetailsPage,
            arguments: arguments,
          );
        },
        isFavoriteIcon: isFavoriteIcon(widget.products[index].isFavorite),
        productName: widget.products[index].title,
        productPrice: widget.products[index].price.toDouble(),
        productImage: widget.products[index].thumbnail,
        productPriceDiscount: widget.products[index].discountPercentage,
        favoriteIconOnTap: () {
          setState(() {
            widget.products[index].isFavorite =
                !widget.products[index].isFavorite;
          });
        },
        productRating: widget.products[index].rating,
        cartIcon: cartIcon(context
            .read<CartCubit>()
            .changeCartIconBool(widget.products[index])),
        cartIconOnTap: () {
          setState(() {
            context.read<CartCubit>().addProduct(
                widget.products[index], widget.products[index].productQuantity);
          });
        },
      ),
    );
  }
}

Widget cartIcon(bool productExist) {
  if (productExist) {
    return const Icon(
      FontAwesomeIcons.cartArrowDown,
      color: Colors.green,
    );
  } else {
    return const Icon(
      FontAwesomeIcons.cartPlus,
      color: Colors.black54,
    );
  }
}

Widget isFavoriteIcon(bool isFavorite) {
  if (isFavorite) {
    return const Icon(
      CupertinoIcons.heart_fill,
      color: Colors.red,
    );
  } else {
    return const Icon(CupertinoIcons.suit_heart);
  }
}
