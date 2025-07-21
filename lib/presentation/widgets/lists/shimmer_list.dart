import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../cards/shimmer_card.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({
    super.key,
    required this.cardsCount,
  });
  final int cardsCount;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      child: SliverGrid.builder(
        itemCount: cardsCount,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 0,
          childAspectRatio: 6 / 9,
        ),
        itemBuilder: (context, index) => const ShimmerCard(),
      ),
    );
  }
}
