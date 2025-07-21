import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.reviewerName,
    required this.reviewerEmail,
    required this.reviewerRating,
    required this.reviewerComment,
    required this.reviewerCommentDate,
  });

  final String reviewerName;
  final String reviewerEmail;
  final int reviewerRating;
  final String reviewerComment;
  final DateTime reviewerCommentDate;

  @override
  Widget build(BuildContext context) {
    final day = DateFormat('EEEE').format(reviewerCommentDate);
    final month = DateFormat('MMMM').format(reviewerCommentDate);
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(right: 8, left: 8, top: 12, bottom: 12),
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                reviewerName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              RatingBarIndicator(
                itemBuilder: (_, index) => const Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.orangeAccent,
                ),
                itemCount: 5,
                rating: reviewerRating.toDouble(),
                itemSize: 20,
              ),
            ],
          ),
          Text(
            reviewerEmail,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            reviewerComment,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            '$day, ${reviewerCommentDate.day} $month',
          ),
        ],
      ),
    );
  }
}
