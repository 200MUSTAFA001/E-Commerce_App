import 'package:api_app/data/models/address_model.dart';
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/address_custom_widgets/addresses_type_list.dart';
import '../../widgets/address_custom_widgets/custom_text_field.dart';
import '../../widgets/address_custom_widgets/default_address_check_box.dart';

class AddNewAddressPage extends StatefulWidget {
  const AddNewAddressPage({super.key});

  @override
  State<AddNewAddressPage> createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityDistrictController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();

  AddressType? addressType;

  bool defaultAddress = false;

  AddressModel? userAddress;

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    streetController.dispose();
    landmarkController.dispose();
    stateController.dispose();
    cityDistrictController.dispose();
    pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Add New Address"),
            pinned: true,
          ),
          CustomTextField(controller: nameController, label: "Name"),
          CustomTextField(controller: mobileController, label: "Mobile Number"),
          CustomTextField(
              controller: streetController, label: "Flat No, Street Details"),
          CustomTextField(controller: landmarkController, label: "Landmark"),
          CustomTextField(controller: pinCodeController, label: "Pincode"),
          CustomTextField(controller: stateController, label: "State"),
          CustomTextField(
              controller: cityDistrictController, label: "City / District"),
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
              onPressed: isAddressFormFilled(
                nameController,
                mobileController,
                streetController,
                landmarkController,
                stateController,
                cityDistrictController,
                pinCodeController,
                addressType,
              )
                  ? () {
                      userAddress = AddressModel(
                        name: nameController.text,
                        mobileNumber: mobileController.text,
                        streetDetails: streetController.text,
                        landMark: landmarkController.text,
                        state: stateController.text,
                        cityDistrict: cityDistrictController.text,
                        pinCode: pinCodeController.text,
                        addressType: addressType!,
                      ).copyWith(defaultAddress: defaultAddress);

                      context.read<AddressCubit>().addAddress(userAddress!);

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
            ).allPadding(padding: 20),
          ),
        ],
      ),
    );
  }
}

bool isAddressFormFilled(
  TextEditingController nameController,
  TextEditingController mobileController,
  TextEditingController streetController,
  TextEditingController landmarkController,
  TextEditingController stateController,
  TextEditingController cityController,
  TextEditingController pinCodeController,
  AddressType? addressType,
) {
  if (nameController.text.isEmpty ||
      mobileController.text.isEmpty ||
      streetController.text.isEmpty ||
      landmarkController.text.isEmpty ||
      stateController.text.isEmpty ||
      cityController.text.isEmpty ||
      pinCodeController.text.isEmpty ||
      addressType == null) {
    return false;
  } else {
    return true;
  }
}
