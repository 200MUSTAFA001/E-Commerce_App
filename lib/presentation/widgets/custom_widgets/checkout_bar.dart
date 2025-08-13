import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/cart_cubit.dart';

class CheckoutBar extends StatelessWidget {
  const CheckoutBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.16,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartProductsPrices =
              context.read<CartCubit>().getProductsPrices();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    r"$" " $cartProductsPrices",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ).onlyPadding(right: 26, left: 26, bottom: 8),
              SizedBox(
                height: context.height * 0.07,
                width: context.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Checkout",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ).allPadding(padding: 16),
            ],
          );
        },
      ),
    ).onlyPadding(top: 10);
  }
}
