import 'package:flutter/material.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("My cart"),
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
      ),
    );
  }
}
