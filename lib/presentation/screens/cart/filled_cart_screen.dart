// Project imports:
import 'package:e_commerce_app/data/models/address_model.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/logic/cubit/address_cubit.dart';
import 'package:e_commerce_app/logic/cubit/hydrated_cubits/cart_cubit.dart';
import 'package:e_commerce_app/presentation/widgets/cart_custom_widgets/cart_checkout_bar.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late ValueNotifier<AddressModel> defaultAddress;
  bool? isAddressesListNotEmpty;

  @override
  void initState() {
    super.initState();
    isAddressesListNotEmpty =
        context.read<AddressCubit>().isAddressListNotEmpty();
    if (isAddressesListNotEmpty == true) {
      defaultAddress =
          ValueNotifier(context.read<AddressCubit>().getDefaultAddress()!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddressCubit>();
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
              ? ChangeDefaultAddressCard(
                  defaultAddress: defaultAddress,
                  cubit: cubit,
                  addressesList: addressesList)
              : const SliverToBoxAdapter(),
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

// class CartAddressBottomSheet extends StatefulWidget {
//   const CartAddressBottomSheet({
//     super.key,
//     required this.addressesList,
//     required this.newDefaultAddress,
//   });
//
//   final List<AddressModel> addressesList;
//   final void Function(AddressModel) newDefaultAddress;
//
//   @override
//   State<CartAddressBottomSheet> createState() => _CartAddressBottomSheetState();
// }
//
// class _CartAddressBottomSheetState extends State<CartAddressBottomSheet> {
//   int? addressID;
//   List<AddressModel> sortedList = [];
//   AddressModel? defaultAddress;
//   AddressModel? newDefaultAddress;
//
//   @override
//   void initState() {
//     super.initState();
//     sortedList =
//         widget.addressesList.sortedBy((x) => x.defaultAddress ? 0 : 1).toList();
//     defaultAddress = widget.addressesList
//         .firstWhere((address) => address.defaultAddress == true);
//     addressID = defaultAddress!.addressID!;
//   }
//
//   void onChanged(int? value) {
//     setState(() {
//       addressID = value!;
//       newDefaultAddress =
//           sortedList.firstWhere((address) => address.addressID == value);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: context.width * 1,
//       height: context.height * 0.6,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//             topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//       ),
//       child: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Change Address",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//                 ),
//                 IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
//               ],
//             ).onlyPadding(left: 16, right: 14, top: 14, bottom: 10),
//           ),
//           SliverList.builder(
//             itemCount: sortedList.length,
//             itemBuilder: (context, index) {
//               int value = sortedList[index].addressID!;
//               return BottomSheetAddressCard(
//                 addressType: sortedList[index].addressType.name,
//                 name: sortedList[index].name,
//                 addressDetails: sortedList[index].streetDetails,
//                 value: value,
//                 groupValue: addressID!,
//                 onChanged: onChanged,
//                 onTap: () {
//                   onChanged(value);
//                 },
//               ).onlyPadding(right: 10, left: 10);
//             },
//           ),
//           SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       context.push(AppRouter.addNewAddressPage);
//                     },
//                     child: const Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(
//                           Icons.add,
//                           color: Colors.deepOrangeAccent,
//                         ),
//                         Text(
//                           "Add New Address",
//                           style: TextStyle(color: Colors.deepOrangeAccent),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (newDefaultAddress != null && addressID != null) {
//                       log("updatedddddddddddd");
//                       context
//                           .read<AddressCubit>()
//                           .changeAddressID(addressID!, newDefaultAddress!);
//                       widget.newDefaultAddress(newDefaultAddress!);
//                       context.pop();
//                     } else {
//                       log("errorrrrrrrrrrrr");
//                       context.pop();
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15)),
//                     backgroundColor: Colors.deepOrangeAccent,
//                     fixedSize: Size(context.width * 1, context.height * 0.08),
//                   ),
//                   child: const Text(
//                     "Continue",
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ).onlyPadding(top: 12, bottom: 12, right: 8, left: 8)
//               ],
//             ).onlyPadding(right: 16, left: 16, top: 10),
//           )
//         ],
//       ),
//     );
//   }
// }
