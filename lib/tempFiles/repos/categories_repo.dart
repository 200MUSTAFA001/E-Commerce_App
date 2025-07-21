import 'dart:convert';

import 'package:api_app/tempFiles/models/categories_model.dart';
import 'package:api_app/tempFiles/services/fake_store_web_service.dart';

class CategoriesRepo {
  final CategoryService categoryService;

  CategoriesRepo(this.categoryService);

  Future<List<String>?> getAllCategories() async {
    final response = await categoryService.getAllCategories();
    final jsonString = json.encode(response);
    final result = categoriesFromJson(jsonString);
    return result.categories;
  }
}
