import 'package:dartx/dartx.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app_router.dart';
import '../../../data/models/address_model.dart';
import '../../../logic/cubit/address_cubit.dart';
import 'bottom_sheet_address_card.dart';

class CartAddressBottomSheet extends StatefulWidget {
  const CartAddressBottomSheet({super.key});

  @override
  State<CartAddressBottomSheet> createState() => _CartAddressBottomSheetState();
}

class _CartAddressBottomSheetState extends State<CartAddressBottomSheet> {
  int? addressID;
  AddressModel? newDefaultAddress;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AddressCubit>();
    final state = cubit.state;
    if (state is AddressLoaded) {
      final defaultAddress = state.defaultAddress;
      if (defaultAddress != null) addressID = defaultAddress.addressID!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 1,
      height: context.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Change Address",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.clear))
              ],
            ).paddingOnly(left: 16, right: 14, top: 14, bottom: 10),
          ),
          BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              if (state is AddressLoaded) {
                final addressesList = state.addressesList;
                final sortedList = addressesList
                    .sortedBy((x) => x.defaultAddress ? 0 : 1)
                    .toList();
                //
                void onChanged(int? value) {
                  setState(() {
                    addressID = value!;
                    newDefaultAddress = addressesList
                        .firstWhere((address) => address.addressID == value);
                  });
                }

                //
                return SliverList.builder(
                  itemCount: sortedList.length,
                  itemBuilder: (context, index) {
                    int value = sortedList[index].addressID!;
                    return BottomSheetAddressCard(
                      addressType: sortedList[index].addressType.name,
                      name: sortedList[index].name,
                      addressDetails: sortedList[index].streetDetails,
                      value: value,
                      groupValue: addressID,
                      onChanged: onChanged,
                      onTap: () {
                        onChanged(value);
                      },
                    ).paddingOnly(right: 10, left: 10);
                  },
                );
              } else {
                return const SliverFillRemaining(
                    child: Center(child: Text("data")));
              }
            },
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(AppRouter.addNewAddressPage);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.deepOrangeAccent,
                        size: 16,
                      ),
                      Text(
                        "Add New Address",
                        style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (newDefaultAddress != null && addressID != null) {
                      context
                          .read<AddressCubit>()
                          .changeAddressID(addressID!, newDefaultAddress!);
                      context.pop();
                    } else {
                      context.pop();
                    }
                  },
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
                ).paddingOnly(top: 12, bottom: 12, right: 8, left: 8)
              ],
            ).paddingOnly(right: 16, left: 16, top: 10),
          )
        ],
      ),
    );
  }
}
