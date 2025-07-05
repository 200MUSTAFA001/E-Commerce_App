import 'dart:developer';

import 'package:dio/dio.dart';

final dio = Dio();

class PlatziService {
  Future<List<dynamic>> getProductByCategory(String category) async {
    final url =
        "https://api.escuelajs.co/api/v1/products/?categorySlug=$category";
    final response = await dio.get(url);
    try {
      return response.data;
    } catch (e) {
      log("there is a problem $e");
      return [];
    }
  }
}
