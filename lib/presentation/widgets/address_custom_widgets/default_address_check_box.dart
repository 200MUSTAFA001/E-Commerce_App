import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';

class DefaultAddressCheckBox extends StatefulWidget {
  DefaultAddressCheckBox({
    super.key,
    required this.isDefaultAddressSelected,
    required this.defaultAddress,
  });

  final void Function(bool) isDefaultAddressSelected;
  bool defaultAddress;

  @override
  State<DefaultAddressCheckBox> createState() => _DefaultAddressCheckBoxState();
}

class _DefaultAddressCheckBoxState extends State<DefaultAddressCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.deepOrangeAccent,
          value: widget.defaultAddress,
          onChanged: (value) {
            setState(() {
              widget.defaultAddress = value!;
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
