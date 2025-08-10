import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_router.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner(
      {super.key, required this.bannerImage, required this.category});
  final String bannerImage;
  final String category;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () {
          context.push(AppRouter.productsByCategoryPage, extra: category);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            bannerImage,
          ).allPadding(padding: 8),
        ),
      ),
    );
  }
}
