// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:e_commerce_app/data/models/products_model.dart';
import 'package:e_commerce_app/data/services/products_service.dart';

class SearchRepo {
  final ProductsSearchService searchForProductService;

  SearchRepo(this.searchForProductService);

  Future<List<Product>> getSearchedProductsList(String product) async {
    final serviceResponse =
        await searchForProductService.searchForProduct(product);
    final jsonString = json.encode(serviceResponse);
    final result = productsModelFromJson(jsonString);
    final searchedList = result.products;
    return searchedList;
  }
}
