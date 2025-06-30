import 'dart:convert';

import 'package:api_app/data/models/product_model.dart';
import 'package:api_app/data/services/store_web_services.dart';

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
