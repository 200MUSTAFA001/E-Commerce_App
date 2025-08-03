import 'package:flutter/material.dart';

class EmptyFavoritesScreen extends StatelessWidget {
  const EmptyFavoritesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("My Favorites"),
          centerTitle: true,
          pinned: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text("No Products"),
          ),
        ),
      ],
    );
  }
}
