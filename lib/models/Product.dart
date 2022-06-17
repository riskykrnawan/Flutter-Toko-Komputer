import 'package:flutter/material.dart';

enum Category { all, laptop, vga, cpu }

class Product {
  final String image, name, description;
  final int price, stock, id;

  final Category category;
  const Product({
    required this.category,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.stock,
  });
}
