// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';

final dio = Dio();

class GetProductsService {
  Future<Map<String, dynamic>> getProducts(String category) async {
    final url = "https://dummyjson.com/products/category/$category";
    final response = await dio.get(url);
    try {
      return response.data;
    } catch (e) {
      log("There is a problem: $e");
      return {};
    }
  }
}

class ProductsSearchService {
  Future<Map<String, dynamic>> searchForProduct(String productName) async {
    final String url = "https://dummyjson.com/products/search?q=$productName";
    final response = await dio.get(url);
    try {
      return response.data;
    } catch (e) {
      log(e.toString());
      return {};
    }
  }
}

/*
order
asc for ascending search
desc for descending search
//
sortBy : price OR title OR 
final sortByUrl = "https://dummyjson.com/products?sortBy=price&order=desc";
*/
