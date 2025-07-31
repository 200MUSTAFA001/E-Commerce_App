import 'package:dio/dio.dart';

final dio = Dio();

// class GetLimitedProductsService {
//   Future<Map<String, dynamic>> getProductsByCategory(String category) async {
//     final url = "https://dummyjson.com/products/category/$category?limit=10";
//     final response = await dio.get(url);
//     try {
//       return response.data;
//     } catch (e) {
//       print("There is a problem: $e");
//       return {};
//     }
//   }
// }

class GetProductsService {
  Future<Map<String, dynamic>> getProducts(String category) async {
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
