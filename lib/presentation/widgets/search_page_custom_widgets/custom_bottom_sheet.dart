// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// Project imports:
import 'package:api_app/extensions.dart';
import '../../../../data/models/sort_option_model.dart';
import '../../../../logic/cubit/search_cubit.dart';

class CustomBottomSheet extends StatefulWidget {
  CustomBottomSheet({
    super.key,
    required this.sortOptionsList,
    required this.searchCubit,
    required this.currentIndex,
    required this.changeCurrent,
  });

  final List<SortOptionModel> sortOptionsList;
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
          children: widget.sortOptionsList.map((sortOption) {
            return ListTile(
              onTap: () {
                setState(() {
                  widget.currentIndex = sortOption.index;
                  //
                  widget.changeCurrent(sortOption.index);
                  //
                  widget.searchCubit.sortSearchList(sortOption.sortType);
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
      ),
    );
  }
}
