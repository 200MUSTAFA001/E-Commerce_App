// Flutter imports:
// Project imports:
import 'package:e_commerce_app/logic/cubit/hydrated_cubits/cart_cubit.dart';
import 'package:flutter/material.dart';
// Package imports:
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
          return FilledCartScreen(cartProducts: cartProducts);
        } else {
          return const EmptyCartScreen();
        }
      },
    );
  }
}
