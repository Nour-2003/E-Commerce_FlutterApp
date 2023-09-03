import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:training_project/screens/ProductDetailsPage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  var jsonList = []; // List to store product data

  @override
  void initState() {
    super.initState();
    getData(); // Fetch product data when the widget initializes
  }

  // Fetch product data from an API (replace with your API URL)
  void getData() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products');

      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data["products"] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  // Custom builder function to display two products per slide
  Widget _buildProducts(BuildContext context, int index, int realIndex) {
    final firstProductIndex = index * 2;
    final secondProductIndex = firstProductIndex + 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (firstProductIndex < jsonList.length) ...[
          _buildProduct(jsonList[firstProductIndex]),
        ],
        if (secondProductIndex < jsonList.length) ...[
          _buildProduct(jsonList[secondProductIndex]),
        ],
      ],
    );
  }

  // Helper function to build an individual product widget
  Widget _buildProduct(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        // Navigate to the product details page when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: SizedBox(
        width: (140 / 375.0) * MediaQuery.of(context).size.width,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.all(
                  (20 / 375.0) * MediaQuery.of(context).size.width,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  product['images'][0] ??
                      "https://i.dummyjson.com/data/products/1/1.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product["title"],
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white // Change this to white for dark theme
                    : Color(0xff4a4e69),
              ),
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product["price"].toString()}",
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white // Change this to white for dark theme
                        : Color(0xff4a4e69),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return jsonList.isNotEmpty
        ? Container(
      height: 250, // Adjust the height as needed
      child: CarouselSlider.builder(
        itemCount: (jsonList.length / 2).ceil(), // Display two products per slide
        itemBuilder: _buildProducts, // Use the custom builder function
        options: CarouselOptions(
          autoPlay: true, // Automatically slide
          autoPlayInterval: Duration(seconds: 2), // Auto slide interval
          aspectRatio: 1.2, // Adjust aspect ratio as needed
          enlargeCenterPage: false,
        ),
      ),
    )
        : const Center(
      child: CircularProgressIndicator(color: Colors.black12),
    );
  }
}
