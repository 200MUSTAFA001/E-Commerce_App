// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:api_app/extensions.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productPrice,
    required this.onTap,
  });

  final String productPrice;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.width * 0.6,
        height: context.height * 0.07,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Add To Cart",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Text(
              r"$" "$productPrice",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ).onlyPadding(right: 10, left: 10);
  }
}
