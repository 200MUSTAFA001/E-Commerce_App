import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productPriceDiscount,
    required this.favoriteIconOnTap,
    required this.productRating,
    required this.isFavoriteIcon,
    required this.gestureOnTap,
    required this.cartIconOnTap,
    required this.cartIcon,
  });

  final String productName;
  final double productPrice;
  final String productImage;
  final double productPriceDiscount;
  final double productRating;
  final void Function() favoriteIconOnTap;
  final void Function() cartIconOnTap;
  final Widget isFavoriteIcon;
  final void Function() gestureOnTap;
  final Widget cartIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureOnTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                child: GridTile(
                  header: Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: favoriteIconOnTap,
                          icon: isFavoriteIcon,
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ),
                        IconButton(
                          onPressed: cartIconOnTap,
                          icon: cartIcon,
                        ),
                      ],
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: productImage,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const Center(
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
            ),
            Text(
              productName,
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
                    r"$" "$productPrice",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    r"$"
                    "${priceBeforeDiscount(productPrice, productPriceDiscount)}",
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${productPriceDiscount.round()}% OFF",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange.shade800,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              spacing: 10,
              children: [
                const Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.orange,
                ),
                Text(
                  productRating.toStringAsFixed(1),
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
