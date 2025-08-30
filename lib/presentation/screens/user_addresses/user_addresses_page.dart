import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';

import '../../widgets/address_custom_widgets/address_page_app_bar.dart';
import '../../widgets/address_custom_widgets/default_address_card.dart';
import '../../widgets/address_custom_widgets/other_addresses_list.dart';

class UserAddressesPage extends StatelessWidget {
  const UserAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AddressPageAppBar(),
          SliverToBoxAdapter(
            child: Card(
              child: const Text(
                "Default Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ).allPadding(10),
            ),
          ),
          const DefaultAddressCard(),
          SliverToBoxAdapter(
            child: Card(
              child: const Text(
                "Other Addresses",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ).allPadding(10),
            ),
          ),
          const OtherAddressesList()
        ],
      ),
    );
  }
}
