import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';

class WelcomeUserTile extends StatelessWidget {
  const WelcomeUserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        title: TypeWriter.text(
          "Hello Mustafa",
          duration: const Duration(milliseconds: 200),
          style: GoogleFonts.fjallaOne(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
        subtitle: TypeWriter.text(
          "Let's start Shopping!",
          duration: const Duration(milliseconds: 250),
          style:
              GoogleFonts.shareTech(fontSize: 18, fontWeight: FontWeight.w500),
          repeat: true,
        ),
      ).onlyPadding(right: 0, left: 0, top: 0, bottom: 6),
    );
  }
}
