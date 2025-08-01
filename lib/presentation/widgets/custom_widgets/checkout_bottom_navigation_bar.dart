import 'package:api_app/presentation/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/cart_cubit.dart';
import 'checkout_bar.dart';

class CheckoutBottomNavigationBar extends StatelessWidget {
  const CheckoutBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.16,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartProductsPrices =
              context.read<CartCubit>().getProductsPrices();
          return CheckoutBar(
            cartProductsPrices: cartProductsPrices,
          );
        },
      ),
    ).onlyPadding(right: 0, left: 0, top: 10, bottom: 0);
  }
}
