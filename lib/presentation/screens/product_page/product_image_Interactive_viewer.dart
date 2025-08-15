// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

class ProductImageInteractiveViewer extends StatelessWidget {
  const ProductImageInteractiveViewer({super.key, required this.productImage});

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: InteractiveViewer(
          child: Hero(
            tag: "00",
            child: CachedNetworkImage(
              imageUrl: productImage,
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
    );
  }
}
