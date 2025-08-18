// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        RatingBarIndicator(
          itemBuilder: (_, index) => const Icon(
            CupertinoIcons.star_fill,
            color: Colors.orangeAccent,
          ),
          itemCount: 5,
          rating: rating,
          itemSize: 24,
        ),
        Text(
          "(${Random().nextInt(1000)})",
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
