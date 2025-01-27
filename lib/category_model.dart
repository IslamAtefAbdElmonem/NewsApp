import 'dart:ui'; // Replace dart:ui_web with dart:ui

import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;

  CategoryModel(
      {required this.id, required this.title, required this.imagePath});
// business entertainment general health science sports technology
  static List<CategoryModel> getCategoryModel(bool isDark) {
    return [
      CategoryModel(
          id: "general",
          title: "General",
          imagePath: isDark
              ? "asset/images/General_dark.png"
              : "asset/images/General.png"),
      CategoryModel(
          id: "business",
          title: "Business",
          imagePath: isDark
              ? "asset/images/Business_dark.png"
              : "asset/images/Business.png"),
      CategoryModel(
          id: "sports",
          title: "Sports",
          imagePath: isDark
              ? "asset/images/Sports_dark.png"
              : "asset/images/Sports.png"),
      CategoryModel(
          id: "health",
          title: "Health",
          imagePath: isDark
              ? "asset/images/Health_dark.png"
              : "asset/images/Health.png"),
      CategoryModel(
          id: "entertainment",
          title: "Entertainment",
          imagePath: isDark
              ? "asset/images/Entertainment_dark.png"
              : "asset/images/Entertainment.png"),
      CategoryModel(
          id: "technology",
          title: "Technology",
          imagePath:
              isDark ? "asset/images/Tech_dark.png" : "asset/images/Tech.png"),
      CategoryModel(
          id: "science",
          title: "Science",
          imagePath: isDark
              ? "asset/images/Science_dark.png"
              : "asset/images/Science.png")
    ];
  }
}
