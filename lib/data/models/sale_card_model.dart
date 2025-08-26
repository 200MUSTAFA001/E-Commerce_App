import 'package:flutter/material.dart';

class SaleCardModel {
  final List<String> cardCategories;
  final String cardName;
  final String cardImage;
  final Color buttonColor;
  final Color cardNameColor;
  final String categoriesCollectionName;

  SaleCardModel({
    required this.cardCategories,
    required this.cardName,
    required this.cardImage,
    required this.buttonColor,
    required this.cardNameColor,
    required this.categoriesCollectionName,
  });
}
