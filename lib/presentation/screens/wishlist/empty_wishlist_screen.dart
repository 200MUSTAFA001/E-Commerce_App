// Flutter imports:
import 'package:api_app/app_router.dart';
// Project imports:
import 'package:api_app/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Package imports:
import 'package:google_fonts/google_fonts.dart';

class EmptyWishlistScreen extends StatelessWidget {
  const EmptyWishlistScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("My Wishlist"),
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
                const SizedBox(
                  height: 20,
                ),
                Image.asset("assets/no_data/noDataWishlist.webp"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Your wishlist is empty",
                  style: GoogleFonts.lato(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.push(AppRouter.allCategoriesPage);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(context.width * 0.8, context.height * 0.08),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text(
                    "Go to categories",
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
    );
  }
}
