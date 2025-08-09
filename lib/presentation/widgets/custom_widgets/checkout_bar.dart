import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/cart_cubit.dart';

class CheckoutBar extends StatelessWidget {
  const CheckoutBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.23,
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
              ).onlyPadding(right: 26, left: 26, top: 0, bottom: 8),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.07,
                width: MediaQuery.sizeOf(context).width * 0.9,
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
          //   CheckoutBar(
          //   cartProductsPrices: cartProductsPrices,
          // );
        },
      ),
    ).onlyPadding(right: 0, left: 0, top: 10, bottom: 0);
  }
}
