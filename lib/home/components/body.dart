import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:training_project/home/components/search.dart';
import 'package:training_project/home/components/discountBanner.dart';
import 'package:training_project/home/components/Categories.dart';
import 'package:training_project/home/components/SpecialOfferCard.dart';
import 'package:training_project/home/components/PopularProductSlider.dart';
import 'package:training_project/screens/login.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void signUserout() {
    FirebaseAuth.instance.signOut();
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
            Categories(),
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
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const Text("See More"),
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
                        color: Theme.of(context).colorScheme.onSurface
                    ),
                  ),
                  const Text("See More"),
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
