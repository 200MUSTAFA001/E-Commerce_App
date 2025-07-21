import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productPrice,
  });

  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.75,
        height: MediaQuery.sizeOf(context).height * 0.07,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Add To Cart",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              r"$" "$productPrice",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
