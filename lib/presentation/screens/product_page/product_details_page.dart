// Dart imports:
// Project imports:
import 'dart:math';

import 'package:e_commerce_app/data/models/products_model.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/logic/cubit/products_cubit.dart';
import 'package:e_commerce_app/presentation/widgets/product_details_page_custom_widgets/reviews_list.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_widgets/product_card.dart';
import '../../widgets/product_details_page_custom_widgets/bottom_sheet_rating_list.dart';
import '../../widgets/product_details_page_custom_widgets/custom_counter.dart';
import '../../widgets/product_details_page_custom_widgets/favorite_icon.dart';
import '../../widgets/product_details_page_custom_widgets/no_reviews_widget.dart';
import '../../widgets/product_details_page_custom_widgets/product_details_page_cart_button.dart';
import '../../widgets/product_details_page_custom_widgets/product_images.dart';
import '../../widgets/product_details_page_custom_widgets/product_page_sublist.dart';
import '../../widgets/product_details_page_custom_widgets/rating_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();
    final category = widget.product.category;
    BlocProvider.of<ProductsCubit>(context).getProductsByCategory(category);
  }

  final ValueNotifier<int> productPriceOnQuantity = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: ValueListenableBuilder<int>(
        valueListenable: productPriceOnQuantity,
        builder: (context, value, _) => ProductDetailsPageCartButton(
          product: widget.product,
          productPrice: (widget.product.price * value).toStringAsFixed(2),
          productQuantity: value,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(
                style:
                    IconButton.styleFrom(backgroundColor: Colors.grey.shade300),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(CupertinoIcons.back)),
            flexibleSpace: ProductImages(images: widget.product.images),
            expandedHeight: context.height * 0.5,
            actions: [
              FavoriteIcon(
                product: widget.product,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Text(
                  widget.product.title,
                  style: GoogleFonts.notoSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRatingBar(rating: widget.product.rating),
                    CustomCounter(
                      quantity: (quantity) {
                        productPriceOnQuantity.value = quantity;
                      },
                      productQuantity: productPriceOnQuantity.value,
                    )
                  ],
                ),
                const SizedBox(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: r"$" "${widget.product.price}  ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: r"$"
                            "${priceBeforeDiscount(widget.product.price, widget.product.discountPercentage)}",
                        style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "   ${widget.product.discountPercentage}% OFF",
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
                        text: widget.product.availabilityStatus,
                        style: TextStyle(
                          color: widget.product.availabilityStatus == "In Stock"
                              ? Colors.greenAccent.shade700
                              : Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.product.description,
                  style: GoogleFonts.notoSans(
                      fontSize: 17, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 10),
              ],
            ).onlyPadding(right: 20, left: 20, top: 20),
          ),
          SliverToBoxAdapter(
            child: Card(
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 14,
                children: [
                  Text(
                    "Shipping & Returns",
                    style: GoogleFonts.notoSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "${widget.product.returnPolicy} and ${widget.product.shippingInformation}  ",
                          style: GoogleFonts.notoSans(
                              fontSize: 18, color: Colors.grey.shade700),
                        ),
                        TextSpan(
                          text: "with ${widget.product.warrantyInformation}",
                          style: GoogleFonts.notoSans(
                            fontSize: 18,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ).onlyPadding(right: 12, left: 12, top: 6, bottom: 12),
            ).onlyPadding(top: 14, bottom: 30),
          ),
          SliverToBoxAdapter(
            child: Card(
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 26,
                children: [
                  Text(
                    "Ratings & Reviews",
                    style: GoogleFonts.notoSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ).onlyPadding(left: 14),
                  ListTile(
                    horizontalTitleGap: 12,
                    leading: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: (widget.product.rating).toStringAsFixed(1),
                            style: GoogleFonts.notoSans(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "/5",
                            style: GoogleFonts.notoSans(
                              color: Colors.black54,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    title: Text(
                      "Overall Rating",
                      style: GoogleFonts.notoSans(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "${Random().nextInt(1000)} Ratings",
                      style: const TextStyle(fontSize: 18),
                    ),
                    trailing: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        side: const BorderSide(
                            width: 2, color: Colors.deepOrangeAccent),
                      ),
                      child: const Text(
                        "Rate",
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).onlyPadding(top: 16, bottom: 20),
          ),
          widget.product.reviews.isEmpty
              ? const NoReviewsWidget()
              : ReviewsList(
                  reviews: widget.product.reviews,
                  reviewsCount: 1,
                ),
          SliverToBoxAdapter(
            child: Card(
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: ListTile(
                onTap: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) =>
                        BottomSheetRatingList(reviews: widget.product.reviews),
                  );
                },
                leading: Text(
                  "View All ${Random().nextInt(1000)} Reviews",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                trailing: const Icon(
                  CupertinoIcons.forward,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ),
          ),
          ProductPageSubList(product: widget.product),
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
