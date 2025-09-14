// Project imports:
import 'package:e_commerce_app/app_router.dart';
import 'package:e_commerce_app/data/models/address_model.dart';
import 'package:e_commerce_app/data/models/checkout_details_model.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/logic/cubit/address_cubit.dart';
import 'package:e_commerce_app/logic/cubit/hydrated_cubits/cart_cubit.dart';
import 'package:e_commerce_app/presentation/widgets/cart_custom_widgets/cart_checkout_bar.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/cart_item_model.dart';
import '../../widgets/cart_custom_widgets/cart_product_card.dart';
import '../../widgets/cart_custom_widgets/change_default_address_card.dart';

class FilledCartScreen extends StatefulWidget {
  const FilledCartScreen({super.key, required this.cartProducts});

  final List<CartItem> cartProducts;

  @override
  State<FilledCartScreen> createState() => _FilledCartScreenState();
}

class _FilledCartScreenState extends State<FilledCartScreen> {
  bool? isAddressesListNotEmpty;

  @override
  void initState() {
    super.initState();
    isAddressesListNotEmpty =
        context.read<AddressCubit>().isAddressListNotEmpty();
  }

  CheckoutDetailsModel checkoutDetails() {
    final pricesDetails = context.read<CartCubit>().getProductsPrices();
    final addressCubitState = context.read<AddressCubit>().state;
    late AddressModel shippingAddress;
    if (addressCubitState is AddressLoaded) {
      shippingAddress = addressCubitState.defaultAddress!;
    }
    return CheckoutDetailsModel(
      subtotal: pricesDetails!.subtotal,
      discounts: pricesDetails.discounts,
      shippingFee: pricesDetails.shippingFee,
      total: pricesDetails.total,
      shippingAddress: shippingAddress.streetDetails,
      paymentMethod: "Credit / Debit Card",
      orderProducts: widget.cartProducts,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CartCheckoutBar(
        onPressed: () {
          context.push(AppRouter.checkOutPage, extra: checkoutDetails());
        },
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: BackButton(
              onPressed: () {
                context.pop();
              },
            ),
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
          isAddressesListNotEmpty == true
              ? const ChangeDefaultAddressCard()
              : const SliverToBoxAdapter(/*Todo : add new address widget */),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
            sliver: SliverList.builder(
              itemCount: widget.cartProducts.length,
              itemBuilder: (context, index) => CartProductCard(
                product: widget.cartProducts[index].product,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
