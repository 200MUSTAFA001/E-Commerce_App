import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app_router.dart';
import '../../../data/models/products_model.dart';
import '../../../logic/cubit/cart_cubit.dart';
import '../custom_widgets/cart_page_counter.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final int productQuantity =
        context.read<CartCubit>().getCartItem(product.id).productQuantity;
    return Card(
      color: Colors.grey.shade100,
      elevation: 0,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                context.push(AppRouter.productDetailsPage, extra: product);
              },
              child: SizedBox(
                width: 100,
                height: 80,
                child: CachedNetworkImage(
                  imageUrl: product.thumbnail,
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
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.push(AppRouter.productDetailsPage, extra: product);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      r"$ " + product.price.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.red),
                  onPressed: () {
                    context.read<CartCubit>().removeProduct(product);
                  },
                ),
                const SizedBox(height: 6),
                CartPageCounter(
                  productQuantity: productQuantity,
                  onIncrement: () {
                    if (productQuantity < 20) {
                      context
                          .read<CartCubit>()
                          .updateQuantity(product.id, productQuantity + 1);
                    }
                  },
                  onDecrement: () {
                    if (productQuantity > 1) {
                      context
                          .read<CartCubit>()
                          .updateQuantity(product.id, productQuantity - 1);
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
