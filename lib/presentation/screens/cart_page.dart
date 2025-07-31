import 'package:api_app/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/cards/cart_product_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final cartProducts = state.cartProducts;
            return cartProducts.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      const SliverAppBar(
                        title: Text("My cart"),
                        centerTitle: true,
                        pinned: true,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: SliverList.builder(
                          itemCount: cartProducts.length,
                          itemBuilder: (context, index) => CartProductCard(
                            product: cartProducts[index],
                          ),
                        ),
                      ),
                    ],
                  )
                : const CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        title: Text("My cart"),
                        centerTitle: true,
                        pinned: true,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text("No Products"),
                        ),
                      ),
                    ],
                  );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
