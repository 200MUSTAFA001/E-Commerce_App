import 'dart:convert';

import 'package:api_app/data/models/products_model.dart';
import 'package:api_app/data/services/web_services.dart';

class ProductsRepo {
  final GetProductsService getProductsService;

  ProductsRepo(this.getProductsService);

  Future<List<Product>> getProductsByCategory(String category) async {
    final serviceResponse = await getProductsService.getProducts(category);
    final jsonString = json.encode(serviceResponse);
    final result = productsModelFromJson(jsonString);
    return result.products;
  }
}
