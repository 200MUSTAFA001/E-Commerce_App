import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/logic/cubit/favorites_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavoriteIcon extends StatefulWidget {
  const CustomFavoriteIcon({super.key, required this.product});

  final Product product;

  @override
  State<CustomFavoriteIcon> createState() => _CustomFavoriteIconState();
}

class _CustomFavoriteIconState extends State<CustomFavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    final isFavorite =
        context.read<FavoritesCubit>().isProductExist(widget.product.id);
    return IconButton(
      onPressed: () {
        if (isFavorite == false) {
          setState(() {
            context.read<FavoritesCubit>().addProduct(widget.product);
          });
        } else {
          setState(() {
            context.read<FavoritesCubit>().removeProduct(widget.product);
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
