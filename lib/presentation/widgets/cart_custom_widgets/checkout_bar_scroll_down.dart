import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/cart_cubit.dart';

class CheckoutBarScrollDown extends StatelessWidget {
  const CheckoutBarScrollDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final pricesBeforeDiscount =
            context.read<CartCubit>().getProductsPrices().first;
        //
        final deliveryFee = (pricesBeforeDiscount * 5 / 100).toInt();
        //
        final totalAmount =
            (context.read<CartCubit>().getProductsPrices().last + deliveryFee);
        //
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
                  r"$" "$totalAmount",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
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
