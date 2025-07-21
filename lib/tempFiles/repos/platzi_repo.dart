import 'dart:convert';

import 'package:api_app/data/models/platzi_Product.dart';
import 'package:api_app/tempFiles/services/platzi_store_web_service.dart';

class PlatziRepo {
  final PlatziService platziService;

  PlatziRepo(this.platziService);

  Future<List<PlatziProduct>> getProductByCategory(String category) async {
    final response = await platziService.getProductByCategory(category);
    final jsonString = json.encode(response);
    final products = platziProductFromJson(jsonString);
    return products;
  }
}
