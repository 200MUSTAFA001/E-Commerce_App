import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/address_cubit.dart';
import 'address_card.dart';

class OtherAddressesList extends StatelessWidget {
  const OtherAddressesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AddressLoaded) {
          final addressesList = state.userAddressesList;
          final otherAddressesList = addressesList
              .where((address) => address.defaultAddress == false)
              .toList();
          return SliverList.builder(
            itemCount: otherAddressesList.length,
            itemBuilder: (context, index) => AddressCard(
              addressItem: otherAddressesList[index],
            ).onlyPadding(bottom: 10),
          );
        } else {
          return const SliverFillRemaining(
            child: Text("no data"),
          );
        }
      },
    );
  }
}
