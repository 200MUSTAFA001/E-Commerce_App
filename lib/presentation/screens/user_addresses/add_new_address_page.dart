import 'dart:developer';

import 'package:api_app/data/models/address_model.dart';
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                ),
                DefaultAddressCheckBox(isDefaultAddressSelected: (value) {
                  defaultAddress = value;
                  if (addressType != null) log(addressType!.name);
                }),
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
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text(
                "Save Address",
                style: TextStyle(fontSize: 18),
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

class DefaultAddressCheckBox extends StatefulWidget {
  const DefaultAddressCheckBox(
      {super.key, required this.isDefaultAddressSelected});

  final void Function(bool) isDefaultAddressSelected;

  @override
  State<DefaultAddressCheckBox> createState() => _DefaultAddressCheckBoxState();
}

class _DefaultAddressCheckBoxState extends State<DefaultAddressCheckBox> {
  bool defaultAddress = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.deepOrangeAccent,
          value: defaultAddress,
          onChanged: (value) {
            setState(() {
              defaultAddress = value!;
              widget.isDefaultAddressSelected(value);
            });
          },
        ),
        const Text(
          "Use as default address",
          style: TextStyle(fontSize: 16),
        ),
      ],
    ).onlyPadding(top: 18, bottom: 12);
  }
}

class AddressesTypeList extends StatefulWidget {
  const AddressesTypeList({super.key, required this.selectedAddressType});

  final void Function(AddressType?) selectedAddressType;

  @override
  State<AddressesTypeList> createState() => _AddressesTypeListState();
}

class _AddressesTypeListState extends State<AddressesTypeList> {
  AddressType? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomRadioItem(
          value: AddressType.home,
          groupValue: selectedAddress,
          addressTypeTitle: "Home",
          onChanged: (value) {
            setState(() {
              selectedAddress = value;
              widget.selectedAddressType(value);
            });
          },
        ),
        CustomRadioItem(
          value: AddressType.office,
          groupValue: selectedAddress,
          addressTypeTitle: "Office",
          onChanged: (value) {
            setState(() {
              selectedAddress = value;
              widget.selectedAddressType(value);
            });
          },
        ),
        CustomRadioItem(
          value: AddressType.other,
          groupValue: selectedAddress,
          addressTypeTitle: "Other",
          onChanged: (value) {
            setState(() {
              selectedAddress = value;
              widget.selectedAddressType(value);
            });
          },
        ),
      ],
    );
  }
}

class CustomRadioItem extends StatelessWidget {
  const CustomRadioItem({
    super.key,
    required this.value,
    required this.groupValue,
    required this.addressTypeTitle,
    required this.onChanged,
  });

  final AddressType value;
  final AddressType? groupValue;
  final String addressTypeTitle;
  final void Function(AddressType?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<AddressType>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.deepOrangeAccent,
        ),
        Text(
          addressTypeTitle,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TextField(
        controller: controller,
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          label: Text(label),
          labelStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              gapPadding: 0, borderRadius: BorderRadius.circular(15)),
        ),
      ).allPadding(padding: 14),
    );
  }
}
