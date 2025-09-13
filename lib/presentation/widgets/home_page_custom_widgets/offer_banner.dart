// Flutter imports:

// Project imports:
import 'package:e_commerce_app/extensions.dart';
// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:go_router/go_router.dart';

import '../../../../app_router.dart';
import '../../../data/models/category_item_model.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner(
      {super.key, required this.bannerImage, required this.categoryItem});
  final String bannerImage;
  final CategoryItem categoryItem;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () {
          context.push(AppRouter.productsByCategoryPage, extra: categoryItem);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            bannerImage,
          ).paddingAll(8),
        ),
      ),
    );
  }
}
