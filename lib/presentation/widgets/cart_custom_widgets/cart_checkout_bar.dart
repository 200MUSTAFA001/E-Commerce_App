import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/hydrated_cubits/cart_cubit.dart';

class CartCheckoutBar extends StatelessWidget {
  const CartCheckoutBar({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final subtotal =
            context.read<CartCubit>().getProductsPrices()!.subtotal;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Total Amount",
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 16)),
                Text(
                  r"$" "$subtotal",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                fixedSize: Size(context.width * 0.5, 60),
                backgroundColor: Colors.deepOrangeAccent,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ).onlyPadding(right: 10, left: 10, top: 5, bottom: 10);
      },
    );
  }
}
