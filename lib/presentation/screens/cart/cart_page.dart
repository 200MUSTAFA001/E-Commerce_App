import 'package:api_app/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'empty_cart_screen.dart';
import 'filled_cart_screen.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          final cartProducts = state.cartProducts;
          return cartProducts.isNotEmpty
              ? FilledCartScreen(cartProducts: cartProducts)
              : const EmptyCartScreen();
        } else {
          return const SizedBox();
          // return const EmptyCartScreen();
        }
      },
    );
  }
}
