import 'package:api_app/presentation/widgets/extensions.dart';
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
    return SliverList.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) => ReviewCard(
        reviewerName: reviews[index].reviewerName,
        reviewerEmail: reviews[index].reviewerEmail,
        reviewerRating: reviews[index].rating,
        reviewerComment: reviews[index].comment,
        reviewerCommentDate: reviews[index].date,
      ).onlyPadding(right: 6, left: 6, top: 0, bottom: 0),
    );
  }
}
