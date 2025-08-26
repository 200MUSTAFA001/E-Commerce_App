// Flutter imports:

// Project imports:
import 'package:api_app/app_router.dart';
import 'package:api_app/extensions.dart';
// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/models/products_model.dart';
import '../../../../logic/cubit/cart_cubit.dart';
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
    return Row(
      children: [
        isProductInCart == true
            ? CartAddedButton(
                onPressed: () {
                  setState(() {
                    context.read<CartCubit>().removeProduct(widget.product);
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
              ),
        ElevatedButton(
          onPressed: () {
            context.push(AppRouter.cartPage);
          },
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Colors.indigo,
          ),
          child: SizedBox(
            width: context.width * 0.2,
            height: context.height * 0.07,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
