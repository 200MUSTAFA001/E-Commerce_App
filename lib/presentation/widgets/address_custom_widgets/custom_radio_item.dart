import 'package:flutter/material.dart';

import '../../../data/models/address_model.dart';

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
