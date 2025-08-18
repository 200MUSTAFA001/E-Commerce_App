// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';

// Project imports:
import 'package:api_app/extensions.dart';

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
        subtitle: TypeWriter.text(
          "Let's start Shopping!",
          duration: const Duration(milliseconds: 100),
          style:
              GoogleFonts.shareTech(fontSize: 18, fontWeight: FontWeight.w500),
          repeat: true,
        ),
      ).onlyPadding(bottom: 6),
    );
  }
}
