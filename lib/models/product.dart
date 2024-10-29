import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, curPrice, oldPrice, discountPercentage;
  final int raterCounts;

  Product({required this.title, required this.description, required this.images, required this.colors, required this.rating, required this.curPrice, required this.oldPrice, required this.discountPercentage, required this.raterCounts});
}