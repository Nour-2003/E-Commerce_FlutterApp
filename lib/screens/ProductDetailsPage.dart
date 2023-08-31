import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back when back button is pressed
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          product['category'], // Replace with actual category key
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        Image.network(
                          product['images'][0],
                          height: 200,
                          width: 200,
                        ),
                        SizedBox(height: 16),
                        Text(
                          product['title'],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          product['description'], // Replace with actual description key
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$${product["price"].toString()}',
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 4),
                            Text(
                              '${product["rating"]} Stars', // Replace with actual rating key
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: (20 / 375.0) * MediaQuery.of(context).size.width,
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              (8 / 375.0) * MediaQuery.of(context).size.width),
                          width: (28 / 375.0) * MediaQuery.of(context).size.width,
                          height: (28 / 375.0) * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color:
                            const Color(0xFF979797).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("HomePageImgs/HeartIcon_2.svg"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
