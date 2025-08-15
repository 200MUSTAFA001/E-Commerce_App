// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:api_app/extensions.dart';

class ShowMoreHomePageButton extends StatelessWidget {
  const ShowMoreHomePageButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.centerLeft,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent),
          child: const Text(
            "Show More",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ).onlyPadding(left: 10, bottom: 24),
    );
  }
}
