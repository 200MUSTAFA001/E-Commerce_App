import 'dart:convert';

import 'package:api_app/data/models/product_model.dart';
import 'package:api_app/tempFiles/services/fake_store_web_service.dart';

class ProductsRepo {
  final ProductService productService;

  ProductsRepo(this.productService);

  Future<List<Product>> getProductsByCategory(String category) async {
    final response = await productService.getProductsByCategory(category);
    final jsonString = json.encode(response);
    final result = productsFromJson(jsonString);
    return result.products;
  }
}
