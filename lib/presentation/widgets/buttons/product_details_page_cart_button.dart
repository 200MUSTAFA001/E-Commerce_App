import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/products_model.dart';
import '../../../logic/cubit/cart_cubit.dart';
import 'add_to_cart_button.dart';
import 'cart_added_button.dart';

class ProductDetailsPageCartButton extends StatefulWidget {
  const ProductDetailsPageCartButton({
    super.key,
    required this.product,
    required this.productPrice,
    required this.productQuantity,
  });

  final Product product;
  final String productPrice;
  final int productQuantity;

  @override
  State<ProductDetailsPageCartButton> createState() =>
      _ProductDetailsPageCartButtonState();
}

class _ProductDetailsPageCartButtonState
    extends State<ProductDetailsPageCartButton> {
  @override
  Widget build(BuildContext context) {
    final isProductInCart =
        context.read<CartCubit>().isProductExist(widget.product);
    return isProductInCart == true
        ? CartAddedButton(
            onPressed: () {
              setState(() {
                isProductInCart == true
                    ? context.read<CartCubit>().removeProduct(widget.product)
                    : context
                        .read<CartCubit>()
                        .addProduct(widget.product, widget.productQuantity);
              });
            },
          )
        : AddToCartButton(
            productPrice: widget.productPrice,
            onTap: () {
              setState(() {
                context
                    .read<CartCubit>()
                    .addProduct(widget.product, widget.productQuantity);
              });
            },
          );
  }
}
