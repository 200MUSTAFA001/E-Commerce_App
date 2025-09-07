import 'package:e_commerce_app/extensions.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

class BottomSheetAddressCard extends StatelessWidget {
  const BottomSheetAddressCard({
    super.key,
    required this.addressType,
    required this.name,
    required this.addressDetails,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.onTap,
  });

  final String addressType;
  final String name;
  final String addressDetails;
  final int value;
  final int groupValue;
  final void Function(int?) onChanged;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.height * 0.16,
        width: context.width * 1,
        padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
        margin: const EdgeInsets.only(top: 10, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 0.5, color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  addressType.capitalize(),
                  style: const TextStyle(fontSize: 18, color: Colors.black87),
                ),
                SizedBox(
                  height: 0,
                  child: Radio<int>(
                    value: value,
                    groupValue: groupValue,
                    onChanged: onChanged,
                    activeColor: Colors.deepOrangeAccent,
                  ),
                ),
              ],
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              addressDetails,
              style: const TextStyle(color: Colors.black54),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ).onlyPadding(right: 10),
          ],
        ),
      ),
    );
  }
}
