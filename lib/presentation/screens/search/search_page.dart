// Flutter imports:
// Project imports:
import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/models/sort_type_enm.dart';
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/search_cubit.dart';
import 'package:api_app/presentation/screens/search/empty_search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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

  List<SortOption> sortOptions = [
    SortOption(index: 0, sortTitle: "title (A-Z)", sortType: SortType.titleAsc),
    SortOption(
        index: 1, sortTitle: "title (Z-A)", sortType: SortType.titleDesc),
    SortOption(index: 2, sortTitle: "price (A-Z)", sortType: SortType.priceAsc),
    SortOption(
        index: 3, sortTitle: "price (Z-A)", sortType: SortType.priceDesc),
    SortOption(
        index: 4, sortTitle: "rating (A-Z)", sortType: SortType.ratingAsc),
    SortOption(
        index: 5, sortTitle: "rating (Z-A)", sortType: SortType.ratingDesc),
    SortOption(
        index: 6, sortTitle: "discount (A-Z)", sortType: SortType.discountAsc),
    SortOption(
        index: 7, sortTitle: "discount (Z-A)", sortType: SortType.discountDesc),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          CustomSearchBar(
            controller: controller,
            onChanged: (value) {
              debouncer.run(() => search(value));
            },
            onPressed: (/*Todo : to clear search bar */) {},
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TotalResultsWidget(),
                Row(
                  children: [
                    const Text("Sort"),
                    IconButton(
                      onPressed: () {
                        showBarModalBottomSheet(
                          topControl: const SizedBox(),
                          elevation: 0,
                          enableDrag: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => CustomBottomSheet(
                            changeCurrent: (value) {
                              currentIndex = value;
                            },
                            currentIndex: currentIndex,
                            searchCubit: cubit,
                            sortOptionsList: sortOptions,
                            searchList: searchList,
                          ),
                        );
                      },
                      icon: const Icon(CupertinoIcons.sort_down),
                    ),
                  ],
                ),
              ],
            ).onlyPadding(left: 10, right: 10),
          ),
          // SearchList(),
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

/*
class SearchList extends StatelessWidget {
  const SearchList({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoaded) {
          final searchList = state.searchList;
          return FilledSearchScreen(searchList: searchList);
        } else {
          return const EmptySearchScreen();
        }
      },
    );
  }
}
*/

class TotalResultsWidget extends StatelessWidget {
  const TotalResultsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchLoaded) {
        final searchListLength = state.searchListLength;
        return Text("Total results: $searchListLength");
      } else {
        const searchListLength = 0;
        return const Text("Total results: $searchListLength");
      }
    });
  }
}

class CustomBottomSheet extends StatefulWidget {
  CustomBottomSheet({
    super.key,
    required this.sortOptionsList,
    required this.searchList,
    required this.searchCubit,
    required this.currentIndex,
    required this.changeCurrent,
  });

  final List<SortOption> sortOptionsList;
  final List<Product> searchList;
  final SearchCubit searchCubit;
  int currentIndex;
  final void Function(int) changeCurrent;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BarBottomSheet(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: widget.sortOptionsList.map((sortOption) {
          return ListTile(
            onTap: () {
              setState(() {
                widget.currentIndex = sortOption.index;
                //
                widget.changeCurrent(sortOption.index);
                //
                widget.searchCubit
                    .sortSearchList(widget.searchList, sortOption.sortType);
              });
              Navigator.pop(context);
            },
            leading: Text(
              sortOption.sortTitle,
              style: GoogleFonts.lato(fontSize: 20),
            ),
            trailing: widget.currentIndex == sortOption.index
                ? const Icon(Icons.check)
                : const SizedBox(),
          );
        }).toList(),
      ).allPadding(padding: 16),
    ));
  }
}

class SortOption {
  final int index;
  final String sortTitle;
  final SortType sortType;

  SortOption(
      {required this.index, required this.sortTitle, required this.sortType});
}
