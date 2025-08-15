// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// Project imports:
import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/repository/search_repo.dart';
import 'package:api_app/data/services/web_services.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<List<Product>> getSearchList(
      String product, bool searchFieldIsEmpty) async {
    final ProductsSearchService searchForProductService =
        ProductsSearchService();
    final SearchRepo productsSearchRepo = SearchRepo(searchForProductService);
    List<Product> searchList = [];
    if (searchFieldIsEmpty == false) {
      searchList = await productsSearchRepo.getSearchedProductsList(product);
      emit(SearchLoaded(
          searchList: searchList, searchListLength: searchList.length));
    } else {
      emit(SearchListEmpty(searchList: const [], searchListLength: 0));
    }

    return searchList;
  }
}
