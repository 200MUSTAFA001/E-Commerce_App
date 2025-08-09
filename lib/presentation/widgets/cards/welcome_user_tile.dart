import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeUserTile extends StatelessWidget {
  const WelcomeUserTile({
    super.key,
  });

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
          style:
              GoogleFonts.shareTech(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ).onlyPadding(right: 0, left: 0, top: 0, bottom: 6),
    );
  }
}
