import 'dart:developer';

import 'package:dio/dio.dart';

final dio = Dio();

class CategoryService {
  Future<Map<String, dynamic>> getAllCategories() async {
    const url = "https://fakestoreapi.in/api/products/category";
    final response = await dio.get(url);
    try {
      // final jsonString = json.encode(response.data);
      // final categories = categoriesFromJson(jsonString);
      return response.data;
    } catch (e) {
      log("there is a problem $e");
      return {};
    }
  }
}

class ProductService {
  Future<Map<String, dynamic>> getProductsByCategory(String category) async {
    final url = "https://fakestoreapi.in/api/products/category?type=$category";
    final response = await dio.get(url);
    try {
      // final jsonString = json.encode(response.data);
      // final products = productsFromJson(jsonString);
      return response.data;
    } catch (e) {
      log("there is a problem $e");
      return {};
    }
  }
}
