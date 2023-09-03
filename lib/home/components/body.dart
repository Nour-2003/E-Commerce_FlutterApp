import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:training_project/home/components/search.dart';
import 'package:training_project/home/components/discountBanner.dart';
import 'package:training_project/home/components/Categories.dart';
import 'package:training_project/home/components/SpecialOfferCard.dart';
import 'package:training_project/home/components/PopularProductSlider.dart';
import 'package:training_project/screens/AllProducts.dart';
import 'package:training_project/screens/login.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<dynamic> jsonList = []; // Declare jsonList as a property

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
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: (30 / 375.0) * MediaQuery.of(context).size.width,
            ),
            Search(),
            SizedBox(
              height: (30 / 375.0) * MediaQuery.of(context).size.width,
            ),
            Discount(),
            SizedBox(
              height: (30 / 375.0) * MediaQuery.of(context).size.width,
            ),
            Categories(jsonList: jsonList), // Pass jsonList to Categories
            SizedBox(
              height: (30 / 375.0) * MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (20 / 375.0) * MediaQuery.of(context).size.width),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special Offer for You",
                    style: TextStyle(
                      fontSize:
                      (18 / 375.0) * MediaQuery.of(context).size.width,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Color(0xffdee2e6) // Change this to white for dark theme
                          : Color(0xff4a4e69),
                    ),
                  ),

                  GestureDetector(
                    child: Icon(
                      Icons.local_offer, // Replace with the desired offer icon
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white // Change this color for dark theme
                          : Color(0xff4a4e69),
                    ),
                  )


                ],
              ),
            ),
            SizedBox(
              height: (20 / 375.0) * MediaQuery.of(context).size.width,
            ),
            SpecialOffer(),
            SizedBox(
              height: (20 / 375.0) * MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (20 / 375.0) * MediaQuery.of(context).size.width),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Products",
                    style: TextStyle(
                      fontSize:
                      (18 / 375.0) * MediaQuery.of(context).size.width,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Color(0xffdee2e6)  // Change this to white for dark theme
                          : Color(0xff4a4e69),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllProducts(), // Navigate to AllProducts screen
                        ),
                      );
                    },
                    child: Text(
                      "See More",
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Color(0xffdee2e6)  // Change this to white for dark theme
                            : Color(0xff4a4e69),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (20 / 375.0) * MediaQuery.of(context).size.width,
            ),
            PopularProducts(),
            SizedBox(
              height: (20 / 375.0) * MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
