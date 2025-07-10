import 'dart:convert';

import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/services/web_services.dart';

class ProductsRepo {
  final GetLimitedProductsService getLimitedProductsService;
  final GetAllProductsService getAllProductsService;

  ProductsRepo(this.getLimitedProductsService, this.getAllProductsService);

  Future<List<Product>> getLimitedProductsByCategory(String category) async {
    final response =
        await getLimitedProductsService.getProductsByCategory(category);
    final jsonString = json.encode(response);
    final result = productsModelFromJson(jsonString);
    return result.products;
  }

  Future<List<Product>> getAllProducts(String category) async {
    final response =
        await getAllProductsService.getProductsByCategory(category);
    final jsonString = json.encode(response);
    final result = productsModelFromJson(jsonString);
    return result.products;
  }
}
