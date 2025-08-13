import 'dart:convert';

import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/services/web_services.dart';

class ProductsSearchRepo {
  final SearchForProductService searchForProductService;

  ProductsSearchRepo(this.searchForProductService);

  Future<List<Product>> getSearchedProductsList(String product) async {
    final serviceResponse =
        await searchForProductService.searchForProduct(product);
    final jsonString = json.encode(serviceResponse);
    final result = productsModelFromJson(jsonString);
    final searchedList = result.products;
    return searchedList;
  }
}
