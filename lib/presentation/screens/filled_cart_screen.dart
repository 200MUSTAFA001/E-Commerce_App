import 'package:api_app/logic/cubit/cart_cubit.dart';
import 'package:api_app/presentation/widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/products_model.dart';
import '../widgets/cards/cart_product_card.dart';

class FilledCartScreen extends StatelessWidget {
  const FilledCartScreen({
    super.key,
    required this.cartProducts,
  });

  final List<Product> cartProducts;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("My cart"),
          centerTitle: true,
          pinned: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
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
          ).onlyPadding(right: 10, left: 0, top: 0, bottom: 0),
        ),
        SliverPadding(
          padding:
              const EdgeInsets.only(top: 0, bottom: 10, right: 10, left: 10),
          sliver: SliverList.builder(
            itemCount: cartProducts.length,
            itemBuilder: (context, index) => CartProductCard(
              product: cartProducts[index],
            ),
          ),
        ),
      ],
    );
  }
}
