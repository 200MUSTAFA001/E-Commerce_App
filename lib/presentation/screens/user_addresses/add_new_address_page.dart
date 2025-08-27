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
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    streetController.dispose();
    landmarkController.dispose();
    stateController.dispose();
    cityController.dispose();
    pinCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SizedBox(
        width: context.width * 1,
        height: context.height * 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("name")),
              ).allPadding(padding: 14),
              TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("mobile")),
              ).allPadding(padding: 14),
              TextField(
                controller: streetController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("street")),
              ).allPadding(padding: 14),
              TextField(
                controller: landmarkController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("landmark")),
              ).allPadding(padding: 14),
              TextField(
                controller: stateController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("state")),
              ).allPadding(padding: 14),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("city")),
              ).allPadding(padding: 14),
              TextField(
                controller: pinCodeController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("pinCode")),
              ).allPadding(padding: 14),
              ElevatedButton(
                  onPressed: () {
                    final AddressModel addressModel = AddressModel(
                      name: nameController.text,
                      mobileNumber: mobileController.text,
                      streetDetails: streetController.text,
                      landMark: landmarkController.text,
                      state: stateController.text,
                      city_district: cityController.text,
                      pinCode: pinCodeController.text,
                      addressType: AddressType.home,
                    );

                    context.read<AddressCubit>().addAddress(addressModel);

                    context.pop();
                  },
                  child: const Text("save")),
            ],
          ),
        ),
      ),
    );
  }
}
