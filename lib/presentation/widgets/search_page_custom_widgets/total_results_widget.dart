// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../../logic/cubit/search_cubit.dart';

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
