import 'package:dio/dio.dart';

final dio = Dio();

class GetCategoriesService {
  Future<List<dynamic>> getCategories() async {
    final url = "https://dummyjson.com/products/category-list";
    final response = await dio.get(url);
    try {
      return response.data;
    } catch (e) {
      print("There is a problem: $e");
      return [];
    }
  }
}

class GetLimitedProductsService {
  Future<Map<String, dynamic>> getProductsByCategory(String category) async {
    final url = "https://dummyjson.com/products/category/$category?limit=10";
    final response = await dio.get(url);
    try {
      return response.data;
    } catch (e) {
      print("There is a problem: $e");
      return {};
    }
  }
}

class GetAllProductsService {
  Future<Map<String, dynamic>> getProductsByCategory(String category) async {
    final url = "https://dummyjson.com/products/category/$category";
    final response = await dio.get(url);
    try {
      return response.data;
    } catch (e) {
      print("There is a problem: $e");
      return {};
    }
  }
}
