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



// class Product {
//   const Product(
//       {required this.category,
//       required this.id,
//       required this.isFeatured,
//       required this.name,
//       required this.price});

//   final Category category;
//   final int id;
//   final bool isFeatured;
//   final String name;
//   final int price;

//   String get assetName => '$id-0.jpg';
//   String get assetPackage => 'shrine_images';

//   @override
//   String toString() => '$name (id=$id)';
// }
