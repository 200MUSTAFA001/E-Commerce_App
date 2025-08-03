import 'package:api_app/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_widgets/checkout_bottom_navigation_bar.dart';
import 'empty_cart_screen.dart';
import 'filled_cart_screen.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CheckoutBottomNavigationBar(),
      backgroundColor: Colors.white,
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final cartProducts = state.cartProducts;
            return cartProducts.isNotEmpty
                ? FilledCartScreen(cartProducts: cartProducts)
                : const EmptyCartScreen();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
