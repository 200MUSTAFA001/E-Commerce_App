// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:slide_countdown/slide_countdown.dart';

// Project imports:
import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/wishlist_cubit.dart';
import '../../../../app_router.dart';
import '../../../../logic/cubit/cart_cubit.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final randomInt = Random().nextInt(22);

  @override
  Widget build(BuildContext context) {
    //
    final isFavorite =
        context.read<WishlistCubit>().isProductExist(widget.product.id);
    final isInCart = context.read<CartCubit>().isProductExist(widget.product);
    final randomBool = widget.product.title.length >= randomInt;
    //
    return GestureDetector(
      onTap: () {
        final product = widget.product;
        context.push(AppRouter.productDetailsPage, extra: product);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: context.height * 0.2,
              width: context.width * 0.5,
              child: GridTile(
                header: Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      randomBool == true
                          ? IconButton(
                              onPressed: () {
                                if (!isFavorite) {
                                  setState(() {
                                    context
                                        .read<WishlistCubit>()
                                        .addProduct(widget.product);
                                  });
                                } else {
                                  setState(() {
                                    context
                                        .read<WishlistCubit>()
                                        .removeProduct(widget.product);
                                  });
                                }
                              },
                              icon: isFavoriteIcon(isFavorite),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.grey.shade200,
                              ),
                            )
                          : const SlideCountdown(
                              duration: Duration(hours: 12),
                            ),
                      IconButton(
                        onPressed: () {
                          if (isInCart == false) {
                            setState(() {
                              context
                                  .read<CartCubit>()
                                  .addProduct(widget.product, 1);
                            });
                          } else {
                            setState(() {
                              context
                                  .read<CartCubit>()
                                  .removeProduct(widget.product);
                            });
                          }
                        },
                        icon: cartIcon(isInCart),
                      ),
                    ],
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.product.thumbnail,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const Center(
                    child: CupertinoActivityIndicator(
                      color: Colors.orange,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error),
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              widget.product.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Row(
                spacing: 6,
                children: [
                  Text(
                    r"$" "${widget.product.price}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    r"$"
                    "${priceBeforeDiscount(widget.product.price, widget.product.discountPercentage)}",
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${widget.product.discountPercentage.round()}% OFF",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade800,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              spacing: 8,
              children: [
                const Icon(
                  CupertinoIcons.star_circle_fill,
                  color: Colors.orange,
                ),
                Text(
                  widget.product.rating.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text("(${Random().nextInt(1000)})")
              ],
            )
          ],
        ),
      ),
    );
  }
}

//
int priceBeforeDiscount(double price, double discount) {
  final originalPrice = (price / (1 - (discount / 100))).round();
  return originalPrice;
}

//
Widget cartIcon(bool productExist) {
  if (productExist) {
    return const Icon(
      FontAwesomeIcons.cartArrowDown,
      color: Colors.deepOrangeAccent,
    );
  } else {
    return const Icon(
      FontAwesomeIcons.cartPlus,
      color: Colors.black54,
    );
  }
}

//
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
