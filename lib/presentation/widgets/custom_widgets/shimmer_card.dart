// Project imports:
import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: context.height * 0.2,
            width: context.width * 0.5,
            child: GridTile(
              header: Container(
                alignment: Alignment.topLeft,
                child: const Icon(
                  Icons.favorite,
                  size: 40,
                ),
              ),
              child: const SizedBox(),
            ),
          ),
          const Text("productName"),
          const Row(
            spacing: 10,
            children: [
              Text("100"),
              Text("50"),
              Text("50 % OFF"),
            ],
          ),
          const Row(
            spacing: 10,
            children: [
              Icon(Icons.ice_skating),
              Text("50"),
              Text("50"),
            ],
          )
        ],
      ).paddingAll(10),
    );
  }
}
