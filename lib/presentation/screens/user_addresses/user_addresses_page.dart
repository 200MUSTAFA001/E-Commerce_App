import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/logic/cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/address_custom_widgets/address_page_app_bar.dart';
import '../../widgets/address_custom_widgets/default_address_card.dart';
import '../../widgets/address_custom_widgets/other_addresses_list.dart';

class UserAddressesPage extends StatelessWidget {
  const UserAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddressCubit>();
    return Scaffold(
      body: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          if (state is AddressLoaded) {
            return CustomScrollView(
              slivers: [
                AddressPageAppBar(cubit: cubit),
                SliverToBoxAdapter(
                  child: Card(
                    child: const Text(
                      "Default Address",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ).allPadding(10),
                  ),
                ),
                const DefaultAddressCard(),
                SliverToBoxAdapter(
                  child: Card(
                    child: const Text(
                      "Other Addresses",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ).allPadding(10),
                  ),
                ),
                const OtherAddressesList()
              ],
            );
          } else {
            return CustomScrollView(
              slivers: [
                AddressPageAppBar(
                  cubit: cubit,
                ),
                const SliverFillRemaining(
                  child: Center(
                    child: Text("no data found"),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
