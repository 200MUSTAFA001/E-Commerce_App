import 'package:flutter/material.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
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
      ),
    );
  }
}
