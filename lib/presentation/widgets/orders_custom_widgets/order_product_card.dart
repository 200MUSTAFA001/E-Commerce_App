import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/app_router.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/cart_item_model.dart';

class OrderProductCard extends StatelessWidget {
  const OrderProductCard({super.key, required this.orderProduct});

  final CartItem orderProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRouter.productDetailsPage, extra: orderProduct.product);
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        color: Colors.white,
        elevation: 1,
        shadowColor: Colors.deepOrangeAccent.shade100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.square(
              dimension: 100,
              child: CachedNetworkImage(
                imageUrl: orderProduct.product.thumbnail,
                progressIndicatorBuilder: (_, __, ___) =>
                    const CupertinoActivityIndicator(
                  color: Colors.deepOrangeAccent,
                  radius: 18,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    "${orderProduct.product.brand}",
                    style: const TextStyle(color: Colors.black54),
                  ),
                  Text(
                    orderProduct.product.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${orderProduct.product.price.toInt()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "x${orderProduct.productQuantity}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ).paddingOnly(right: 20)
                ],
              ),
            ),
          ],
        ).paddingAll(10),
      ),
    );
  }
}
