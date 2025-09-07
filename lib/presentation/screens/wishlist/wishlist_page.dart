// Flutter imports:
// Project imports:
import 'package:e_commerce_app/logic/cubit/hydrated_cubits/wishlist_cubit.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

import 'empty_wishlist_screen.dart';
import 'filled_wishlist_screen.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoaded) {
            final wishlist = state.wishlist;
            return FilledWishlistScreen(
              wishlist: wishlist,
            );
          } else {
            return const EmptyWishlistScreen();
          }
        },
      ),
    );
  }
}
