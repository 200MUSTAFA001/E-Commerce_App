// Flutter imports:
// Project imports:
import 'package:e_commerce_app/extensions.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:google_fonts/google_fonts.dart';

class WelcomeUserTile extends StatelessWidget {
  const WelcomeUserTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        title: Text(
          "Hello Mustafa",
          style: GoogleFonts.fjallaOne(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
        subtitle: Text(
          "Let's start Shopping!",
          style: GoogleFonts.shareTech(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ).paddingOnly(bottom: 6),
    );
  }
}
