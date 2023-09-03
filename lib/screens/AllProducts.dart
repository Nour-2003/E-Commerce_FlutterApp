import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:training_project/screens/ProductDetailsPage.dart';

class AllProducts extends StatefulWidget {
  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  var jsonList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      // Replace the URL with your actual API endpoint
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF22223B),
                Color(0xff4A4E69),
                Color(0xff9A8C98),
                Color(0xffC9ADA7),
                Color(0xffF2E9E4),
              ],
            ),
          ),
        ),
        title: Text('All Products'),
      ),
      body: jsonList.isNotEmpty
          ? ListView.builder(
        itemCount: jsonList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(jsonList[index]["title"]),
              leading: Image.network(
                jsonList[index]['images'][0] ??
                    "https://i.dummyjson.com/data/products/1/1.jpg",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              subtitle: Text("\$${jsonList[index]["price"].toString()}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      product: jsonList[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(
          color: Colors.black12,
        ),
      ),
    );
  }
}
