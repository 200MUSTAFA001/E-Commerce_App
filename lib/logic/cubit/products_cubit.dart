// Project imports:
import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/repository/products_repo.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/products_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  List<Product> originalList = [];

  Future<void> getProductsByCategory(String category) async {
    await productsRepo.getProductsByCategory(category).then((products) {
      originalList = products;
      emit(ProductsLoaded(products));
    });
  }

  Future<void> getSeveralListForHomePage(
    String category,
    String recommendedCategory,
    String sublistCategory,
  ) async {
    await productsRepo.getProductsByCategory(category).then((products) async {
      //
      final recommendedProducts = await ProductsRepo(GetProductsService())
          .getProductsByCategory(recommendedCategory);
      //
      final sublistProducts = await ProductsRepo(GetProductsService())
          .getProductsByCategory(sublistCategory);
      //
      emit(SeveralListsForHomePageLoaded(
        products,
        recommendedProducts,
        sublistProducts,
      ));
    });
  }

  Future<void> searchForProduct(
      String productTitle, bool isSearchBarEmpty, String category) async {
    final currentState = state;

    if (isSearchBarEmpty == false && currentState is ProductsLoaded) {
      final List<Product> products = List<Product>.from(currentState.products);

      final searchedList = products
          .where(
              (product) => product.title.startsWith(productTitle.capitalize()))
          .toList();

      emit(ProductsLoaded(searchedList));
    } else {
      emit(ProductsLoaded(originalList));
    }
  }

  Future<void> getProductsBySeveralCategories(List<String> categories) async {
    emit(ProductsLoading());

    final List<Product> allProducts = [];

    for (var category in categories) {
      final products = await productsRepo.getProductsByCategory(category);
      allProducts.addAll(products);
    }
    emit(ProductsLoaded(allProducts));
  }
}
