import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_router.dart';

class AddressPageAppBar extends StatelessWidget {
  const AddressPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: context.height * 0.1,
      title: Text(
        "Addresses",
        style: GoogleFonts.oswald(letterSpacing: 1, fontSize: 26),
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            context.push(AppRouter.addNewAddressPage);
          },
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              side: const BorderSide(color: Colors.deepOrangeAccent, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, color: Colors.deepOrangeAccent, size: 16),
              Text(
                "New Address",
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 16),
              ),
            ],
          ),
        ).onlyPadding(right: 10),
      ],
    );
  }
}
