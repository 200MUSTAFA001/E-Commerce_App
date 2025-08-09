import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';

import '../../../data/models/products_model.dart';
import '../cards/review_card.dart';

class SliverReviewList extends StatelessWidget {
  const SliverReviewList({
    super.key,
    required this.reviews,
  });

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: reviews.length,
      itemBuilder: (context, index) => ReviewCard(
        reviewerName: reviews[index].reviewerName,
        reviewerEmail: reviews[index].reviewerEmail,
        reviewerRating: reviews[index].rating,
        reviewerComment: reviews[index].comment,
        reviewerCommentDate: reviews[index].date,
      ).onlyPadding(right: 10, left: 10, top: 10, bottom: 12),
      separatorBuilder: (context, index) => const Divider(
        thickness: 3,
        indent: 80,
        endIndent: 80,
      ),
    );
  }
}
