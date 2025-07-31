import 'dart:convert';

import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/services/web_services.dart';

class ProductsRepo {
  // final GetLimitedProductsService getLimitedProductsService;
  final GetProductsService getProductsService;

  ProductsRepo(this.getProductsService);

  // Future<List<Product>> getLimitedProductsByCategory(String category) async {
  //   final response =
  //       await getLimitedProductsService.getProductsByCategory(category);
  //   final jsonString = json.encode(response);
  //   final result = productsModelFromJson(jsonString);
  //   return result.products;
  // }

  Future<List<Product>> getProductsByCategory(String category) async {
    final response = await getProductsService.getProducts(category);
    final jsonString = json.encode(response);
    final result = productsModelFromJson(jsonString);
    return result.products;
  }
}
