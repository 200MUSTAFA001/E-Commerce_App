import 'dart:math';

import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';

class CartAddedButton extends StatelessWidget {
  const CartAddedButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent.shade700,
          foregroundColor: Colors.white),
      onPressed: onPressed,
      child: SizedBox(
        width: context.width * 0.75,
        height: context.height * 0.07,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16,
          children: [
            const Icon(
              Icons.done,
              size: 30,
              color: Colors.white,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Added to the Cart",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Text(
                  "added by ${Random().nextInt(1000)} users",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
