// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:api_app/logic/cubit/wishlist_cubit.dart';
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
            final favoritesList = state.wishlist;
            return favoritesList.isNotEmpty
                ? FilledWishlistScreen(
                    favoritesList: favoritesList,
                  )
                : const EmptyWishlistScreen();
          } else {
            return const SizedBox();
            // return const EmptyFavoritesScreen();
          }
        },
      ),
    );
  }
}
