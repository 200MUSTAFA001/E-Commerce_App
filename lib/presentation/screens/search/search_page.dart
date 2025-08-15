import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/search_cubit.dart';
import 'package:api_app/presentation/screens/search/empty_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/models/debouncer_model.dart';
import '../../widgets/custom_widgets/custom_search_bar.dart';
import 'filled_search_screen.dart';

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
    controller.dispose();
    super.dispose();
  }

  void search(String value) {
    BlocProvider.of<SearchCubit>(context).getSearchList(value, value.isEmpty);
  }

  final Debouncer debouncer =
      Debouncer(duration: const Duration(milliseconds: 500));

  List<Product> searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          CustomSearchBar(
            controller: controller,
            onChanged: (value) {
              debouncer.run(() => search(value));
            },
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                  if (state is SearchLoaded) {
                    final searchListLength = state.searchListLength;
                    return Text("Total results: $searchListLength");
                  } else {
                    const searchListLength = 0;
                    return const Text("Total results: $searchListLength");
                  }
                }),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.sort),
                )
              ],
            ).onlyPadding(left: 10),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoaded) {
                searchList = state.searchList;
                return FilledSearchScreen(searchList: searchList);
              } else {
                searchList = [];
                return const EmptySearchScreen();
              }
            },
          ),
        ],
      ),
    );
  }
}
