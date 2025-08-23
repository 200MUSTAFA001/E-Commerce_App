import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.reviewerName,
    required this.reviewerComment,
    required this.reviewerRate,
    required this.reviewerCommentDate,
  });

  final String reviewerName;
  final String reviewerComment;
  final int reviewerRate;
  final DateTime reviewerCommentDate;

  @override
  Widget build(BuildContext context) {
    final month = DateFormat('MMM').format(reviewerCommentDate);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 0,
      children: [
        RatingBarIndicator(
          itemPadding: const EdgeInsets.only(right: 6),
          itemBuilder: (_, __) => const Icon(FontAwesomeIcons.solidStar,
              color: Colors.orangeAccent),
          itemCount: 5,
          rating: reviewerRate.toDouble(),
          itemSize: 20,
        ),
        const SizedBox(height: 14),
        Text(
          reviewerComment,
          style:
              GoogleFonts.notoSans(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 6),
        const Text(
          "Shirt is exactly as shown on the above picture perfect fitting as expected value for money product must buy",
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        const SizedBox(height: 14),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: "$reviewerName, ",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              TextSpan(
                text:
                    "${reviewerCommentDate.day} $month ${reviewerCommentDate.year}",
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
