// Flutter imports:
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
  });

  final List<CartItem> cartProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CheckoutBar(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("My cart"),
            centerTitle: true,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: context.height * 0.1,
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<CartCubit>().clearCart();
                  },
                  child: const Text(
                    "Remove All",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
              ],
            ).onlyPadding(right: 10),
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
