import 'dart:convert';

import 'package:api_app/data/services/web_services.dart';

import '../models/categories_model.dart';

class CategoriesRepo {
  final GetCategoriesService getCategoriesService;

  CategoriesRepo(this.getCategoriesService);

  Future<List<String>> getAllCategories() async {
    final response = await getCategoriesService.getCategories();
    final jsonString = json.encode(response);
    final result = categoriesModelFromJson(jsonString);
    return result;
  }
}
