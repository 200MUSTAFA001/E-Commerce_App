import 'package:api_app/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Hero(
            tag: "searchBarTag",
            child: SizedBox(
              width: context.width * 0.9,
              child: const SearchBar(
                padding: WidgetStatePropertyAll(EdgeInsets.only(left: 14)),
                leading: Icon(CupertinoIcons.search),
                hintText: "What are Looking for ?",
                elevation: WidgetStatePropertyAll(0),
                textInputAction: TextInputAction.search,
              ).onlyPadding(right: 10, left: 10),
            ),
          ),
        ],
        toolbarHeight: context.height * 0.1,
      ),
      body: Column(),
    );
  }
}
