// Project imports:
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/cart_item_model.dart';
import '../../widgets/cart_custom_widgets/cart_product_card.dart';
import '../../widgets/cart_custom_widgets/checkout_bar.dart';

class FilledCartScreen extends StatelessWidget {
  const FilledCartScreen({
    super.key,
    required this.cartProducts,
    required this.controller,
  });

  final List<CartItem> cartProducts;

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CheckoutBar(controller: controller),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            title: const Text("My cart"),
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: context.height * 0.1,
            actions: [
              TextButton(
                onPressed: () {
                  context.read<CartCubit>().clearCart();
                },
                child: const Text("Clear", style: TextStyle(color: Colors.red)),
              ),
              const SizedBox(width: 10)
            ],
          ),
          SliverPadding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 10, right: 10, left: 10),
            sliver: SliverList.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) => CartProductCard(
                product: cartProducts[index].product,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
