// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../../logic/cubit/search_cubit.dart';
import '../../screens/search/empty_search_screen.dart';
import '../../screens/search/filled_search_screen.dart';

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
