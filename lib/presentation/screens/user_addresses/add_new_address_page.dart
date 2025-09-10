import 'package:e_commerce_app/data/models/address_model.dart';
import 'package:e_commerce_app/data/models/debouncer_model.dart';
import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/logic/cubit/address_cubit.dart';
import 'package:e_commerce_app/logic/cubit/address_service_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../widgets/address_custom_widgets/address_search_bottom_sheet.dart';
import '../../widgets/address_custom_widgets/addresses_type_list.dart';
import '../../widgets/address_custom_widgets/custom_text_field.dart';
import '../../widgets/address_custom_widgets/default_address_check_box.dart';

class AddNewAddressPage extends StatefulWidget {
  const AddNewAddressPage({super.key});

  @override
  State<AddNewAddressPage> createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final streetController = TextEditingController();
  final landmarkController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final postcodeController = TextEditingController();

  final searchController = TextEditingController();

  AddressType? addressType;

  bool defaultAddress = false;

  AddressModel? userAddress;

  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  void addressSearch(String address, bool isSearchBarEmpty) {
    BlocProvider.of<AddressServiceCubit>(context)
        .getSearchedAddressesList(address, isSearchBarEmpty);
  }

  bool isAddressFormFilled() {
    if (nameController.text.isEmpty ||
        mobileController.text.isEmpty ||
        streetController.text.isEmpty ||
        landmarkController.text.isEmpty ||
        stateController.text.isEmpty ||
        cityController.text.isEmpty ||
        postcodeController.text.isEmpty ||
        addressType == null) {
      return false;
    } else {
      return true;
    }
  }

  //

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    streetController.dispose();
    landmarkController.dispose();
    stateController.dispose();
    cityController.dispose();
    postcodeController.dispose();
    searchController.dispose();
    debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AddressServiceCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Add New Address"),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Card(
              child: const Text(
                "Contact Info",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ).allPadding(10),
            ),
          ),
          CustomTextField(controller: nameController, label: "Name"),
          CustomTextField(controller: mobileController, label: "Mobile Number"),
          SliverToBoxAdapter(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Address Info",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      showCustomSearchAddressBottomSheet(context, cubit);
                    },
                    child: const Icon(CupertinoIcons.search_circle, size: 30),
                  )
                ],
              ).onlyPadding(left: 10, right: 16, top: 10, bottom: 10),
            ),
          ),
          CustomTextField(
              controller: streetController, label: "Flat No, Street Details"),
          CustomTextField(controller: cityController, label: "City"),
          CustomTextField(controller: stateController, label: "State"),
          CustomTextField(controller: landmarkController, label: "Landmark"),
          CustomTextField(controller: postcodeController, label: "Postcode"),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Address Type",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                AddressesTypeList(
                  selectedAddressType: (value) {
                    addressType = value;
                  },
                  selectedAddress: addressType,
                ),
                DefaultAddressCheckBox(
                  isDefaultAddressSelected: (value) {
                    defaultAddress = value;
                  },
                  defaultAddress: defaultAddress,
                ),
              ],
            ).onlyPadding(left: 14, top: 12),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed:
                  // isAddressFormFilled()
                  //     ?
                  () {
                userAddress = AddressModel(
                  name: nameController.text,
                  mobileNumber: mobileController.text,
                  streetDetails: streetController.text,
                  landMark: landmarkController.text,
                  state: stateController.text,
                  cityDistrict: cityController.text,
                  pinCode: postcodeController.text,
                  addressType: addressType!,
                ).copyWith(defaultAddress: defaultAddress);

                context.read<AddressCubit>().addAddress(userAddress!);
                context.pop();
              }
              // : null
              ,
              style: ElevatedButton.styleFrom(
                fixedSize: Size(0, context.height * 0.07),
                backgroundColor: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text(
                "Save Address",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ).allPadding(20),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showCustomSearchAddressBottomSheet(
      BuildContext context, AddressServiceCubit cubit) {
    return showBarModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: cubit,
          child: AddressSearchBottomSheet(
            searchController: searchController,
            onChanged: (value) {
              debouncer.run(() => addressSearch(value, value.isEmpty));
            },
            addressDetails: (address) {
              streetController.text = address.displayName;
              cityController.text = address.address.city ?? "";
              stateController.text = address.address.state ?? "";
              landmarkController.text = address.address.road ?? "";
              postcodeController.text = address.address.postcode ?? "";
            },
          ),
        );
      },
    );
  }
//
}
