import 'package:api_app/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_router.dart';

class HomePageCustomSearchBar extends StatelessWidget {
  const HomePageCustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "searchBarTag",
      child: SizedBox(
        width: context.width * 0.9,
        height: context.height * 0.07,
        child: GestureDetector(
          onTap: () {
            context.push(AppRouter.searchPage);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            margin: const EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade300),
            child: const Icon(
              CupertinoIcons.search,
              color: Colors.black45,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}