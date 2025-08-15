// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/logic/cubit/wishlist_cubit.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key, required this.product});

  final Product product;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    final isFavorite =
        context.read<WishlistCubit>().isProductExist(widget.product.id);
    return IconButton(
      onPressed: () {
        if (isFavorite == false) {
          setState(() {
            context.read<WishlistCubit>().addProduct(widget.product);
          });
        } else {
          setState(() {
            context.read<WishlistCubit>().removeProduct(widget.product);
          });
        }
      },
      icon: isFavorite == true
          ? const Icon(
              CupertinoIcons.heart_fill,
              color: Colors.red,
              size: 32,
            )
          : const Icon(
              CupertinoIcons.suit_heart,
              size: 32,
            ),
      style: IconButton.styleFrom(backgroundColor: Colors.grey.shade300),
    );
  }
}
