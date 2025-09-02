import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/address_model.dart';
import '../../../logic/cubit/address_cubit.dart';
import 'cart_address_bottom_sheet.dart';

class ChangeDefaultAddressCard extends StatelessWidget {
  const ChangeDefaultAddressCard({
    super.key,
    required this.defaultAddress,
    required this.cubit,
    required this.addressesList,
  });

  final ValueNotifier<AddressModel> defaultAddress;
  final AddressCubit cubit;
  final List<AddressModel> addressesList;

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
            ValueListenableBuilder<AddressModel>(
              valueListenable: defaultAddress,
              builder: (context, value, _) => ListTile(
                title: Text(
                  defaultAddress.value.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  defaultAddress.value.streetDetails,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => BlocProvider.value(
                        value: cubit,
                        child: CartAddressBottomSheet(
                          cubit: cubit,
                          addressesList: addressesList,
                          newDefaultAddress: (newAddress) {
                            defaultAddress.value = newAddress;
                          },
                        ),
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
                    style:
                        TextStyle(color: Colors.deepOrangeAccent, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ).onlyPadding(bottom: 10),
    );
  }
}
