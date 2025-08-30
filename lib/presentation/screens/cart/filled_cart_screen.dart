// Project imports:
import 'package:api_app/app_router.dart';
import 'package:api_app/data/models/address_model.dart';
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/address_cubit.dart';
import 'package:api_app/logic/cubit/hydrated_cubits/cart_cubit.dart';
import 'package:api_app/presentation/widgets/cart_custom_widgets/cart_checkout_bar.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/cart_item_model.dart';
import '../../widgets/cart_custom_widgets/cart_product_card.dart';

class FilledCartScreen extends StatelessWidget {
  const FilledCartScreen({
    super.key,
    required this.cartProducts,
  });

  final List<CartItem> cartProducts;

  @override
  Widget build(BuildContext context) {
    final isAddressesListNotEmpty =
        context.read<AddressCubit>().isAddressListNotEmpty();
    final defaultAddress = context.read<AddressCubit>().getDefaultAddress();
    final addressesList = context.read<AddressCubit>().getAddressesList();
    return Scaffold(
      bottomNavigationBar: const CartCheckoutBar(),
      backgroundColor: Colors.white,
      body: CustomScrollView(
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
          isAddressesListNotEmpty == true
              ? SliverToBoxAdapter(
                  child: Card(
                    color: Colors.white,
                    elevation: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Deliver to :",
                          style: TextStyle(fontSize: 16),
                        ).onlyPadding(left: 6, top: 10, bottom: 6),
                        ListTile(
                          title: Text(
                            defaultAddress!.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            defaultAddress.streetDetails,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: OutlinedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                  width: context.width * 1,
                                  height: context.height * 0.6,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        topLeft: Radius.circular(15)),
                                  ),
                                  child: CartAddressBottomSheet(
                                      addressesList: addressesList),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 2, color: Colors.deepOrangeAccent),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text(
                              "Change",
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent, fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  ).onlyPadding(bottom: 10),
                )
              : const SliverToBoxAdapter(),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
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

class CartAddressBottomSheet extends StatelessWidget {
  const CartAddressBottomSheet({super.key, required this.addressesList});

  final List<AddressModel> addressesList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Change Address",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: addressesList.map((address) {
              return BottomSheetAddressCard(
                addressType: address.addressType.name,
                name: address.name,
                addressDetails: address.streetDetails,
                defaultAddress: address.defaultAddress,
              );
            }).toList(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                context.push(AppRouter.addNewAddressPage);
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.deepOrangeAccent,
                  ),
                  Text(
                    "Add New Address",
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Colors.deepOrangeAccent,
              fixedSize: Size(context.width * 1, context.height * 0.08),
            ),
            child: const Text(
              "Continue",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ).onlyPadding(top: 12, bottom: 12, right: 8, left: 8)
        ],
      ).onlyPadding(right: 16, left: 16, top: 10),
    );
  }
}

class BottomSheetAddressCard extends StatelessWidget {
  const BottomSheetAddressCard({
    super.key,
    required this.addressType,
    required this.name,
    required this.addressDetails,
    required this.defaultAddress,
  });

  final String addressType;
  final String name;
  final String addressDetails;
  final bool defaultAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.16,
      width: context.width * 1,
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      margin: const EdgeInsets.only(top: 10, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(width: 0.5, color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                addressType.capitalize(),
                style: const TextStyle(fontSize: 18, color: Colors.black87),
              ),
              SizedBox(
                height: 0,
                child: Radio<bool>(
                  value: defaultAddress,
                  groupValue: defaultAddress,
                  onChanged: (value) {},
                  activeColor: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            addressDetails,
            style: const TextStyle(color: Colors.black54),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ).onlyPadding(right: 10),
        ],
      ),
    );
  }
}
