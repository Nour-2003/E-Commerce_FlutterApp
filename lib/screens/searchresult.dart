import 'package:flutter/material.dart';
import 'package:training_project/models/product.dart';
import 'package:training_project/screens/ProductDetailsScreen.dart';

class searchresult extends StatefulWidget {
  @override
  _searchresultState createState() => _searchresultState();
}

class _searchresultState extends State<searchresult> {
  List<Product> filteredProducts = []; // Store filtered products here
  String searchQuery = '';

  void updateFilteredProducts(String query) {
    setState(() {
      searchQuery = query;
      filteredProducts = demoProducts
          .where((product) =>
          product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    // Handle the back button action here
                    Navigator.pop(context);
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.symmetric(
                    horizontal:
                    (20 / 375.0) * MediaQuery.of(context).size.width,
                  ),
                  child: TextField(
                    onChanged: updateFilteredProducts,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search Product",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF979797).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag),
                      SizedBox(width: 10),
                      Text('${filteredProducts.length} Products'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredProducts[index].title),
                    onTap: () {
                      // Navigate to the product details screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                            product: filteredProducts[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
