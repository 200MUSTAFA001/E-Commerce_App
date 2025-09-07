// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Project imports:
import 'package:e_commerce_app/app_router.dart';

class ProductImages extends StatelessWidget {
  ProductImages({
    super.key,
    required this.images,
  });

  final List<String> images;

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(500),
          bottomRight: Radius.circular(500),
        ),
      ),
      child: FlexibleSpaceBar(
        background: PageView.builder(
          controller: pageController,
          itemCount: images.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              context.push(AppRouter.productImageInteractiveViewer,
                  extra: images[index]);
            },
            child: Hero(
              tag: "00",
              child: CachedNetworkImage(
                imageUrl: images[index],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const Center(
                  child: CupertinoActivityIndicator(
                    radius: 24,
                    color: Colors.deepOrange,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
          ),
        ),
        title: SmoothPageIndicator(
          controller: pageController,
          count: images.length,
          effect: const WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Colors.orange,
            type: WormType.underground,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
