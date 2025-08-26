// Dart imports:
import 'dart:math';

// Project imports:
import 'package:api_app/extensions.dart';
// Flutter imports:
import 'package:flutter/material.dart';

class CartAddedButton extends StatelessWidget {
  const CartAddedButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: context.width * 0.6,
        height: context.height * 0.07,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.greenAccent.shade700,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          spacing: 16,
          children: [
            const Icon(
              Icons.done,
              size: 30,
              color: Colors.white,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Added to the Cart",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "added by ${Random().nextInt(1000)} users",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ).onlyPadding(right: 10, left: 10);
  }
}
