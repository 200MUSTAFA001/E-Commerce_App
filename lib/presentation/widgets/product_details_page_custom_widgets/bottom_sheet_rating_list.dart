import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/presentation/widgets/product_details_page_custom_widgets/reviews_list.dart';
import 'package:flutter/material.dart';

import '../../../data/models/products_model.dart';

class BottomSheetRatingList extends StatelessWidget {
  const BottomSheetRatingList({super.key, required this.reviews});

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            leadingWidth: 0,
            leading: const SizedBox(),
            title: const Text(
              "Ratings & Reviews",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.clear, size: 30),
              )
            ]),
        ReviewsList(
          reviews: reviews,
          reviewsCount: reviews.length,
        )
      ],
    ).paddingOnly(right: 8, left: 8, bottom: 8);
  }
}
