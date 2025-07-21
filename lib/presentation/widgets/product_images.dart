import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
          itemBuilder: (context, index) => CachedNetworkImage(
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
