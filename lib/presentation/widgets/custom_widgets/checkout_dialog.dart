import 'package:flutter/material.dart';

Future checkoutDialog(BuildContext context) {
  return showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      shadowColor: Colors.white,
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          Icon(
            Icons.done_outline,
            color: Colors.greenAccent.shade700,
            size: 100,
          ),
          const SizedBox(height: 20),
          const Text(
            "Purchase Successful",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const Text(
            "The seller has been notified to ship your item and we will only release the payment after you have received it.",
            style: TextStyle(fontSize: 16),
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          )
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () {},
          child: const Text("Go to homePage"),
        )
      ],
    ),
  );
}
