// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  final String status;
  final String message;
  final List<String> categories;

  Categories({
    required this.status,
    required this.message,
    required this.categories,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        status: json["status"],
        message: json["message"],
        categories: List<String>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "categories": List<dynamic>.from(categories.map((x) => x)),
      };
}
