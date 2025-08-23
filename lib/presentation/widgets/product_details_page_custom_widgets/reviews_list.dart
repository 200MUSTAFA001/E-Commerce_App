// Flutter imports:

// Project imports:
import 'package:api_app/extensions.dart';
import 'package:api_app/presentation/widgets/product_details_page_custom_widgets/review_card.dart';
// Flutter imports:
import 'package:flutter/material.dart';

import '../../../../data/models/products_model.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    super.key,
    required this.reviews,
    required this.reviewsCount,
  });

  final List<Review> reviews;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: reviewsCount,
      itemBuilder: (context, index) => ReviewCard(
        reviewerName: reviews[index].reviewerName,
        reviewerComment: reviews[index].comment,
        reviewerRate: reviews[index].rating,
        reviewerCommentDate: reviews[index].date,
      ).onlyPadding(right: 20, left: 20, top: 10, bottom: 20),
    );
  }
}
