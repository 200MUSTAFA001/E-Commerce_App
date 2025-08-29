import 'package:flutter/material.dart';

import '../../../data/models/address_model.dart';
import 'custom_radio_item.dart';

class AddressesTypeList extends StatefulWidget {
  AddressesTypeList({
    super.key,
    required this.selectedAddressType,
    required this.selectedAddress,
  });

  final void Function(AddressType?) selectedAddressType;
  AddressType? selectedAddress;

  @override
  State<AddressesTypeList> createState() => _AddressesTypeListState();
}

class _AddressesTypeListState extends State<AddressesTypeList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomRadioItem(
          value: AddressType.home,
          groupValue: widget.selectedAddress,
          addressTypeTitle: "Home",
          onChanged: (value) {
            setState(() {
              widget.selectedAddress = value;
              widget.selectedAddressType(value);
            });
          },
        ),
        CustomRadioItem(
          value: AddressType.office,
          groupValue: widget.selectedAddress,
          addressTypeTitle: "Office",
          onChanged: (value) {
            setState(() {
              widget.selectedAddress = value;
              widget.selectedAddressType(value);
            });
          },
        ),
        CustomRadioItem(
          value: AddressType.other,
          groupValue: widget.selectedAddress,
          addressTypeTitle: "Other",
          onChanged: (value) {
            setState(() {
              widget.selectedAddress = value;
              widget.selectedAddressType(value);
            });
          },
        ),
      ],
    );
  }
}
