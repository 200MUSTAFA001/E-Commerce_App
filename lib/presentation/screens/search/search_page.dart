// Flutter imports:
// Project imports:
import 'package:api_app/data/models/sort_type_enm.dart';
import 'package:api_app/extensions.dart';
import 'package:api_app/logic/cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../data/models/debouncer_model.dart';
import '../../../data/models/sort_option_model.dart';
import '../../widgets/search_page_custom_widgets/custom_bottom_sheet.dart';
import '../../widgets/search_page_custom_widgets/custom_search_bar.dart';
import '../../widgets/search_page_custom_widgets/search-list.dart';
import '../../widgets/search_page_custom_widgets/total_results_widget.dart';

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

  final List<SortOptionModel> sortOptions = [
    SortOptionModel(
        index: 0, sortTitle: "title (A-Z)", sortType: SortType.titleAsc),
    SortOptionModel(
        index: 1, sortTitle: "title (Z-A)", sortType: SortType.titleDesc),
    SortOptionModel(
        index: 2, sortTitle: "price (A-Z)", sortType: SortType.priceAsc),
    SortOptionModel(
        index: 3, sortTitle: "price (Z-A)", sortType: SortType.priceDesc),
    SortOptionModel(
        index: 4, sortTitle: "rating (A-Z)", sortType: SortType.ratingAsc),
    SortOptionModel(
        index: 5, sortTitle: "rating (Z-A)", sortType: SortType.ratingDesc),
    SortOptionModel(
        index: 6, sortTitle: "discount (A-Z)", sortType: SortType.discountAsc),
    SortOptionModel(
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
                        showSortBottomSheet(context, cubit, sortOptions);
                      },
                      icon: const Icon(CupertinoIcons.sort_down),
                    ),
                  ],
                ),
              ],
            ).onlyPadding(left: 10, right: 10),
          ),
          const SearchList(),
        ],
      ),
    );
  }

  Future<dynamic> showSortBottomSheet(
    BuildContext context,
    SearchCubit cubit,
    List<SortOptionModel> sortOptions,
  ) {
    return showBarModalBottomSheet(
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
      ),
    );
  }
}
