import 'dart:math';

import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/logic/cubit/favorites_cubit.dart';
import 'package:api_app/presentation/widgets/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../app_router.dart';
import '../../../logic/cubit/cart_cubit.dart';

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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final arguments = widget.product;
        Navigator.pushNamed(
          context,
          AppRouter.productDetailsPage,
          arguments: arguments,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: context.screenWidth * 0.5,
              child: GridTile(
                header: Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (context
                                  .read<FavoritesCubit>()
                                  .isProductExist(widget.product.id) ==
                              false) {
                            setState(() {
                              context
                                  .read<FavoritesCubit>()
                                  .addProduct(widget.product);
                            });
                          } else {
                            setState(() {
                              context
                                  .read<FavoritesCubit>()
                                  .removeProduct(widget.product);
                            });
                          }
                        },
                        icon: isFavoriteIcon(context
                            .read<FavoritesCubit>()
                            .isProductExist(widget.product.id)),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (context
                                  .read<CartCubit>()
                                  .isProductExist(widget.product) ==
                              false) {
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
                        icon: cartIcon(context
                            .read<CartCubit>()
                            .isProductExist(widget.product)),
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
//
// class ProductCard extends StatefulWidget {
//   const ProductCard({
//     super.key,
//     required this.productName,
//     required this.productImage,
//     required this.productPrice,
//     required this.onTap,
//     required this.isFavoriteIcon,
//   });
//
//   final String productName;
//   final String productImage;
//   final double productPrice;
//   final void Function() onTap;
//   final Widget isFavoriteIcon;
//
//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }
//
// class _ProductCardState extends State<ProductCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 6, bottom: 6),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15), color: Colors.grey.shade50),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Best Seller",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               IconButton(
//                 onPressed: widget.onTap,
//                 icon: widget.isFavoriteIcon,
//               )
//             ],
//           ).onlyPadding(right: 0, left: 10, top: 0, bottom: 0),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.14,
//             width: MediaQuery.of(context).size.width * 1,
//             child: CachedNetworkImage(
//               imageUrl: widget.productImage,
//               progressIndicatorBuilder: (context, url, downloadProgress) =>
//                   Center(
//                       child: CircularProgressIndicator(
//                           value: downloadProgress.progress)),
//               errorWidget: (context, url, error) =>
//                   const Center(child: Icon(Icons.error)),
//               fit: BoxFit.cover,
//             ),
//           ),
//           FittedBox(
//             alignment: Alignment.center,
//             fit: BoxFit.scaleDown,
//             child: Text(
//               widget.productName,
//               style: const TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           ).onlyPadding(right: 4, left: 4, top: 10, bottom: 0),
//           Text(
//             r"$ " + widget.productPrice.toStringAsFixed(1),
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w800,
//             ),
//           ).onlyPadding(right: 0, left: 4, top: 0, bottom: 0),
//         ],
//       ),
//     );
//   }
// }

//
