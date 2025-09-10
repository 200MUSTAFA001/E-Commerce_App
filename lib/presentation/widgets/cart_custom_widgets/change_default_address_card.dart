import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/logic/cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_address_bottom_sheet.dart';

class ChangeDefaultAddressCard extends StatelessWidget {
  const ChangeDefaultAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
            BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                if (state is AddressLoaded) {
                  final defaultAddress = state.defaultAddress;
                  return defaultAddress != null
                      ? ListTile(
                          title: Text(
                            defaultAddress.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 18,
                            ),
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
                                builder: (context) =>
                                    const CartAddressBottomSheet(),
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
                      : ListTile(
                          title: const Text("please choose address"),
                          trailing: OutlinedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    const CartAddressBottomSheet(),
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
                        );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ).onlyPadding(bottom: 10),
    );
  }
}
