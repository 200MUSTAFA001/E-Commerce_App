// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:e_commerce_app/data/models/products_model.dart';
import 'package:e_commerce_app/data/services/products_service.dart';

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
