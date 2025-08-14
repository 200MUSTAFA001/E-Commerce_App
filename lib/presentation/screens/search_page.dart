import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/search_cubit.dart';
import 'package:api_app/presentation/widgets/lists/products_by_category_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/debouncer_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    debouncer.dispose();
    super.dispose();
  }

  void search(String value) {
    BlocProvider.of<SearchCubit>(context).getSearchList(value, value.isEmpty);
  }

  final Debouncer debouncer =
      Debouncer(duration: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            toolbarHeight: context.height * 0.1,
            pinned: true,
            backgroundColor: Colors.transparent,
            actions: [
              Hero(
                tag: "searchBarTag",
                child: SizedBox(
                  width: context.width * 0.9,
                  child: SearchBar(
                    onChanged: (value) {
                      debouncer.run(() => search(value));
                    },
                    padding:
                        const WidgetStatePropertyAll(EdgeInsets.only(left: 14)),
                    controller: controller,
                    leading: const Icon(CupertinoIcons.search),
                    hintText: "What are Looking for ?",
                    elevation: const WidgetStatePropertyAll(0),
                    textInputAction: TextInputAction.search,
                  ).onlyPadding(right: 10, left: 10),
                ),
              ),
            ],
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoaded) {
                final searchList = state.searchList;
                return ProductsGrid(
                    products: searchList, itemCount: searchList.length);
              } else {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text("no products"),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
