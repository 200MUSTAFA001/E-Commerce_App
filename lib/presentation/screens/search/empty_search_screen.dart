import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptySearchScreen extends StatelessWidget {
  const EmptySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          children: [
            Image.asset("assets/no_data/noDataSearch.webp"),
            Text(
              "no result found",
              style: GoogleFonts.workSans(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
