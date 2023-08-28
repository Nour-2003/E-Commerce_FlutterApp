import 'package:flutter/material.dart';
import 'package:training_project/models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back when the button is pressed
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  product.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.images.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Image.asset(
                          product.images[index],
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  product.description,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 5),
                    Text(
                      '${product.rating}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
