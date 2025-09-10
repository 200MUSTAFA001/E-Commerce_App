import 'dart:developer';

import 'package:e_commerce_app/extensions.dart';
import 'package:e_commerce_app/presentation/widgets/address_custom_widgets/addresses_type_list.dart';
import 'package:e_commerce_app/presentation/widgets/address_custom_widgets/default_address_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/address_model.dart';
import '../../../logic/cubit/address_cubit.dart';
import '../../widgets/address_custom_widgets/custom_text_field.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({super.key, required this.address});

  final AddressModel address;

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final streetController = TextEditingController();
  final landmarkController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final postcodeController = TextEditingController();

  AddressModel? userAddress;
  int? addressID;

  AddressType? addressType;
  bool? defaultAddress;

  @override
  void initState() {
    super.initState();

    nameController.text = widget.address.name;
    mobileController.text = widget.address.mobileNumber;
    streetController.text = widget.address.streetDetails;
    landmarkController.text = widget.address.landMark;
    stateController.text = widget.address.state;
    cityController.text = widget.address.cityDistrict;
    postcodeController.text = widget.address.pinCode;
    //
    addressType = widget.address.addressType;
    defaultAddress = widget.address.defaultAddress;
    addressID = widget.address.addressID;
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    streetController.dispose();
    landmarkController.dispose();
    stateController.dispose();
    cityController.dispose();
    postcodeController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text("Add New Address"),
            title: ElevatedButton(
                onPressed: () {
                  log("${widget.address.addressID}");
                },
                child: const Text("data")),
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
              child: const Text(
                "Address Info",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ).allPadding(10),
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
                  defaultAddress: defaultAddress!,
                ),
              ],
            ).onlyPadding(left: 14, top: 12),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: isAddressFormFilled()
                  ? () {
                      userAddress = AddressModel(
                        addressID: addressID,
                        name: nameController.text,
                        mobileNumber: mobileController.text,
                        streetDetails: streetController.text,
                        landMark: landmarkController.text,
                        state: stateController.text,
                        cityDistrict: cityController.text,
                        pinCode: postcodeController.text,
                        addressType: addressType!,
                      ).copyWith(defaultAddress: defaultAddress);

                      log("$addressID");
                      log("${widget.address.addressID}");

                      context
                          .read<AddressCubit>()
                          .editAddress(widget.address.addressID!, userAddress!);

                      context.pop();
                    }
                  : null,
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
}
