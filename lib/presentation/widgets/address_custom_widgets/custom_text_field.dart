import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';

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
        // onTapOutside: (PointerDownEvent event) {
        //   FocusManager.instance.primaryFocus!.unfocus();
        // },
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
      ).allPadding(14),
    );
  }
}
