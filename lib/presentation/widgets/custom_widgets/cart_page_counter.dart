import 'package:flutter/material.dart';

class CartPageCounter extends StatelessWidget {
  final int productQuantity;
  final void Function() onIncrement;
  final void Function() onDecrement;

  const CartPageCounter({
    super.key,
    required this.productQuantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40,
            width: 30,
            child: IconButton(
              padding: const EdgeInsets.symmetric(vertical: 4),
              onPressed: onDecrement,
              icon: const Icon(Icons.remove),
              style: IconButton.styleFrom(iconSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:
                Text('$productQuantity', style: const TextStyle(fontSize: 13)),
          ),
          SizedBox(
            width: 30,
            height: 40,
            child: IconButton(
              padding: const EdgeInsets.symmetric(vertical: 4),
              onPressed: onIncrement,
              icon: const Icon(Icons.add),
              style: IconButton.styleFrom(iconSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
