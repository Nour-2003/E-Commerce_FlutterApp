import 'package:flutter/material.dart';
import 'package:training_project/screens/ProductDetailsPage.dart';

class CategoryProductsPage extends StatelessWidget {
  final String categoryText;
  final List<dynamic> productList;

  CategoryProductsPage({required this.categoryText, required this.productList});

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredProducts = productList.where((product) {
      return product["category"] == categoryText;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF7643),
                Color(0xff281537),
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Products in $categoryText'),
      ),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredProducts[index]["title"]),
            leading: Image.network(
              filteredProducts[index]["images"][0] ??
                  "https://i.dummyjson.com/data/products/1/1.jpg", // Use the correct field for the image URL
              width: 60, // Adjust the width as needed
              height: 60, // Adjust the height as needed
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
            subtitle: Text("\$${filteredProducts[index]["price"].toString()}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    product: filteredProducts[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
