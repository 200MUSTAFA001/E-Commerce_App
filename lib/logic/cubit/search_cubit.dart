// Flutter imports:

// Project imports:
import 'package:e_commerce_app/data/models/products_model.dart';
import 'package:e_commerce_app/data/models/sort_type_enm.dart';
import 'package:e_commerce_app/data/repository/search_repo.dart';
import 'package:e_commerce_app/data/services/products_service.dart';
// Package imports:
import 'package:dartx/dartx.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  List<Product> originalList = [];

  Future<void> getSearchList(String product, bool searchFieldIsEmpty) async {
    final ProductsSearchService searchForProductService =
        ProductsSearchService();
    //
    final SearchRepo productsSearchRepo = SearchRepo(searchForProductService);
    //
    if (searchFieldIsEmpty == false) {
      final searchList =
          await productsSearchRepo.getSearchedProductsList(product);
      //
      final searchListSorted =
          searchList.sortedBy((product) => product.title).toList();
      originalList = searchListSorted;
      //
      emit(SearchLoaded(
          searchList: searchListSorted, searchListLength: searchList.length));
    } else {
      emit(SearchListEmpty(searchList: const [], searchListLength: 0));
    }
  }

  void sortSearchList(SortType sortType) {
    final cubitState = state;

    if (cubitState is SearchLoaded) {
      List<Product> sortedList = List<Product>.from(cubitState.searchList);

      switch (sortType) {
        case SortType.titleAsc:
          sortedList = sortedList.sortedBy((product) => product.title).toList();
        case SortType.titleDesc:
          sortedList = sortedList
              .sortedByDescending((product) => product.title)
              .toList();
        case SortType.priceAsc:
          sortedList = sortedList.sortedBy((product) => product.price).toList();
        case SortType.priceDesc:
          sortedList = sortedList
              .sortedByDescending((product) => product.price)
              .toList();
        case SortType.discountAsc:
          sortedList = sortedList
              .sortedBy((product) => product.discountPercentage)
              .toList();
        case SortType.discountDesc:
          sortedList = sortedList
              .sortedByDescending((product) => product.discountPercentage)
              .toList();
        case SortType.ratingAsc:
          sortedList =
              sortedList.sortedBy((product) => product.rating).toList();
        case SortType.ratingDesc:
          sortedList = sortedList
              .sortedByDescending((product) => product.rating)
              .toList();
      }
      emit(SearchLoaded(
          searchList: sortedList, searchListLength: sortedList.length));
    }
  }
}
