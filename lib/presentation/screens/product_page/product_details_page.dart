// Dart imports:
import 'dart:math';

// Project imports:
import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/extensions.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_widgets/product_card.dart';
import '../../widgets/home_page_custom_widgets/reviews_list.dart';
import '../../widgets/product_details_page_custom_widgets/cart_button.dart';
import '../../widgets/product_details_page_custom_widgets/custom_counter.dart';
import '../../widgets/product_details_page_custom_widgets/favorite_icon.dart';
import '../../widgets/product_details_page_custom_widgets/product_images.dart';
import '../../widgets/product_details_page_custom_widgets/rating_bar.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({super.key, required this.product});

  final Product product;

  final ValueNotifier<int> productPriceOnQuantity = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ValueListenableBuilder<int>(
        valueListenable: productPriceOnQuantity,
        builder: (context, value, _) => ProductDetailsPageCartButton(
          product: product,
          productPrice: (product.price * value).toStringAsFixed(2),
          productQuantity: value,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            leading: IconButton(
                style:
                    IconButton.styleFrom(backgroundColor: Colors.grey.shade300),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(CupertinoIcons.back)),
            flexibleSpace: ProductImages(images: product.images),
            expandedHeight: context.height * 0.5,
            actions: [
              FavoriteIcon(
                product: product,
              ),
              const SizedBox(
                width: 16,
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 18,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar(rating: product.rating),
                    CustomCounter(
                      quantity: (quantity) {
                        productPriceOnQuantity.value = quantity;
                      },
                      productQuantity: productPriceOnQuantity.value,
                    )
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: r"$" "${product.price}  ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: r"$"
                            "${priceBeforeDiscount(product.price, product.discountPercentage)}",
                        style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "   ${product.discountPercentage}% OFF",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.orange.shade800,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Availability : ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: product.availabilityStatus,
                        style: TextStyle(
                          color: product.availabilityStatus == "In Stock"
                              ? Colors.greenAccent.shade700
                              : Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Shipping & Returns",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "${product.returnPolicy} and ${product.shippingInformation}  ",
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade700),
                      ),
                      TextSpan(
                        text: "with ${product.warrantyInformation}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Reviews",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "( ${(product.rating).toStringAsFixed(1)} Ratings )",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${Random().nextInt(1000)} Reviews",
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
            ).onlyPadding(right: 10, left: 16, top: 20),
          ),
          ReviewsList(reviews: product.reviews),
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.height * 0.15,
            ),
          ),
        ],
      ),
    );
  }
}
