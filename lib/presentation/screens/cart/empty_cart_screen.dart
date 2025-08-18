// Flutter imports:
import 'package:api_app/app_router.dart';
// Project imports:
import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Package imports:
import 'package:google_fonts/google_fonts.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("My cart"),
            centerTitle: true,
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/no_data/noDataCart.webp"),
                  Text(
                    "Your cart is empty",
                    style: GoogleFonts.lato(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.push(AppRouter.searchPage);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size(context.width * 0.8, context.height * 0.08),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text(
                      "Lets do some Shopping",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
