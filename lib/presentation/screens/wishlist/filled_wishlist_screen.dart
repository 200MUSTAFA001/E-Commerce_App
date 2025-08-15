import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/wishlist_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/products_model.dart';
import '../../widgets/cards/product_card.dart';

class FilledWishlistScreen extends StatelessWidget {
  const FilledWishlistScreen({super.key, required this.favoritesList});

  final List<Product> favoritesList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 6,
            children: [
              Icon(
                CupertinoIcons.heart_fill,
                color: Colors.red,
              ),
              Text("My Wishlist"),
            ],
          ),
          pinned: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            TextButton(
              onPressed: () {
                context.read<WishlistCubit>().clearWishlist();
              },
              child: const Text(
                "Clear",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        SliverGrid.builder(
          itemCount: favoritesList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 0,
            childAspectRatio: 6 / 9,
          ),
          itemBuilder: (context, index) => ProductCard(
            product: favoritesList[index],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: context.height * 0.1,
          ),
        ),
      ],
    );
  }
}
