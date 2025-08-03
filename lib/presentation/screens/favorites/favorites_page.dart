import 'package:api_app/logic/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'empty_favorites_screen.dart';
import 'filled_favorites_screen.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoaded) {
            final favoritesList = state.favoritesList;
            return favoritesList.isNotEmpty
                ? FilledFavoritesScreen(
                    favoritesList: favoritesList,
                  )
                : const EmptyFavoritesScreen();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
