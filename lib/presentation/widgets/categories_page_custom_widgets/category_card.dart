// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:e_commerce_app/extensions.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key,
      required this.categoryName,
      required this.categoryImage,
      required this.onTap});

  final String categoryName;
  final SvgPicture categoryImage;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.height * 0.1,
              width: context.width * 0.2,
              child: categoryImage,
            ),
            Text(
              categoryName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 2,
            ).onlyPadding(top: 10, bottom: 5),
          ],
        ),
      ),
    );
  }
}
