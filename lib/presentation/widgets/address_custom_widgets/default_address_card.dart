import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/address_cubit.dart';
import 'address_card.dart';

class DefaultAddressCard extends StatelessWidget {
  const DefaultAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AddressLoaded) {
          final defaultAddress = state.defaultAddress;
          return SliverToBoxAdapter(
              child: AddressCard(addressItem: defaultAddress)
                  .onlyPadding(bottom: 14));
        } else {
          return const SliverFillRemaining(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
