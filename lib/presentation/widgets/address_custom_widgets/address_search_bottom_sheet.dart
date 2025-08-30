import 'package:flutter/material.dart';

import '../../../data/models/address_result_model.dart';
import 'address_search_bar.dart';
import 'address_search_list.dart';

class AddressSearchBottomSheet extends StatelessWidget {
  const AddressSearchBottomSheet(
      {super.key,
      required this.searchController,
      required this.onChanged,
      required this.addressDetails});

  final TextEditingController searchController;
  final void Function(String) onChanged;
  final void Function(AddressResultModel) addressDetails;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          leading: BackButton(),
          title: Text("Search for Address"),
          backgroundColor: Colors.white,
        ),
        AddressSearchBar(
            searchController: searchController, onChanged: onChanged),
        AddressSearchList(addressDetails: addressDetails),
      ],
    );
  }
}
