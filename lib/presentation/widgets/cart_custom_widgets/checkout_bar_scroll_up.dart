// Project imports:
import 'package:api_app/extensions.dart';
// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/cubit/cart_cubit.dart';

class CheckoutBarScrollUp extends StatelessWidget {
  const CheckoutBarScrollUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        //
        final cartLength = context.read<CartCubit>().cartLength();
        //
        final pricesBeforeDiscount =
            context.read<CartCubit>().getProductsPrices().first;
        //
        final cartProductsDiscounts =
            context.read<CartCubit>().getProductsPrices()[1];
        //
        final deliveryFee = (pricesBeforeDiscount * 5 / 100).toInt();
        //
        final totalAmount =
            (context.read<CartCubit>().getProductsPrices().last + deliveryFee);
        //
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: Colors.white,
              elevation: 1,
              child: SizedBox(
                height: context.height * 0.24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartLength == 1
                              ? "Price Details ($cartLength item)"
                              : "Price Details ($cartLength items)",
                          style: const TextStyle(fontSize: 18),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade700,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text("Apply Coupon"),
                        ),
                      ],
                    ),
                    CustomRowText(
                      rowTitle: "Total Price",
                      rowValue: r"$" "$pricesBeforeDiscount",
                    ),
                    CustomRowText(
                      rowTitle: "Discount",
                      rowValue: r"- $" "$cartProductsDiscounts",
                    ),
                    CustomRowText(
                      rowTitle: "Delivery fee",
                      rowValue: r"+ $" "$deliveryFee",
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Amount",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          r"$" "$totalAmount",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ).onlyPadding(left: 30, right: 30),
              ).onlyPadding(top: 0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Total Amount",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      r"$" "$totalAmount",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
            ).onlyPadding(right: 10, left: 10, top: 5, bottom: 10)
          ],
        );
      },
    );
  }
}

class CustomRowText extends StatelessWidget {
  const CustomRowText({
    super.key,
    required this.rowTitle,
    required this.rowValue,
  });

  final String rowTitle;
  final String rowValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rowTitle,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        ),
        Text(
          rowValue,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
        ),
      ],
    );
  }
}
