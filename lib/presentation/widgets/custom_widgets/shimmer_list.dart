import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/presentation/widgets/custom_widgets/shimmer_card.dart';
import 'package:flutter/material.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: context.height * 0.4,
        width: context.width * 0.9,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) => const ShimmerCard(),
        ),
      ),
    );
  }
}
