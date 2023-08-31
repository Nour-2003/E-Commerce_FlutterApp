import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:training_project/screens/ProductDetailsPage.dart';

class SearchDisp extends StatefulWidget {
  @override
  State<SearchDisp> createState() => _SearchDispState();
}

class _SearchDispState extends State<SearchDisp> {
  var jasonList = [];
  var filteredList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio().get('https://dummyjson.com/products');

      if (response.statusCode == 200) {
        setState(() {
          jasonList = response.data["products"] as List;
          filteredList = jasonList; // Initialize filtered list with all products
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void searchProducts(String query) {
    setState(() {
      filteredList = jasonList.where((product) {
        final title = product["title"].toString().toLowerCase();
        return title.contains(query.toLowerCase());
      }).toList();
    });
  }

  void navigateToProductDetails(Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context); // Navigate back when back button is pressed
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: searchProducts,
                    decoration: InputDecoration(
                      hintText: 'Search for products...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF979797).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.shopping_bag),
                    SizedBox(width: 10),
                    Text(
                      '${filteredList.length} ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Set the color to black
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    filteredList[index]["title"],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    navigateToProductDetails(filteredList[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
