import 'package:flutter/material.dart';

class Product
{
  final String title,description;
  final List<String> images;
  final List<Color> colors;
  final double rating , price;
  final bool isFavourite,isPopular;


  Product({
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });

}
  List<Product> demoProducts = [
  Product(
    images: [
      "HomePageImgs/ps4_console_white_1.png",
      "HomePageImgs/ps4_console_white_2.png",
      "HomePageImgs/ps4_console_white_3.png",
      "HomePageImgs/ps4_console_white_4.png",
    ],
    colors: [
     const Color(0xFFF6625E),
     const Color(0xFF836DB8),
     const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: "Wireless Controller for PS4™",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    images: [
      "HomePageImgs/ImagePopularProduct2.png",
    ],
    colors: [
     const Color(0xFFF6625E),
     const Color(0xFF836DB8),
     const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: "Nike Sport White - Man Pant",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    images: [
      "HomePageImgs/glap.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: "Gloves XC Omega - Polygon",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    images: [
      "HomePageImgs/wirelessheadset.png",
    ],
    colors: [
     const Color(0xFFF6625E),
     const Color(0xFF836DB8),
     const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: "Logitech Head",
    rating: 4.1,
    isFavourite: true,
  ),
];

