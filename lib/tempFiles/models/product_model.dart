// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  final String status;
  final String message;
  final List<Product> products;

  Products({
    required this.status,
    required this.message,
    required this.products,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        status: json["status"],
        message: json["message"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int id;
  final String title;
  final String image;
  final int price;
  final String description;
  final String brand;
  final String model;
  final String? color;
  final String category;
  final int? discount;
  final bool? popular;
  final bool? onSale;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.brand,
    required this.model,
    this.color,
    required this.category,
    this.discount,
    this.popular,
    this.onSale,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        brand: json["brand"],
        model: json["model"],
        color: json["color"],
        category: json["category"],
        discount: json["discount"],
        popular: json["popular"],
        onSale: json["onSale"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "price": price,
        "description": description,
        "brand": brand,
        "model": model,
        "color": color,
        "category": category,
        "discount": discount,
        "popular": popular,
        "onSale": onSale,
      };
}
