import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:training_project/home/components/search.dart';
import 'package:training_project/home/components/discountBanner.dart';
import 'package:training_project/home/components/Categories.dart';
import 'package:training_project/home/components/SpecialOfferCard.dart';
import 'package:training_project/home/components/PopularProductSlider.dart';
import 'package:training_project/screens/login.dart';
//import 'package:training_project/customNavBar.dart';

//import 'package:training_project/models/product.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  void signUserout()
  {
    FirebaseAuth.instance.signOut();

  }
  @override
  Widget build(context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: (30 / 375.0) * MediaQuery.of(context).size.width, //edited
            ),

            //start of the search section
            Search(),
            //end of the search section

            SizedBox(
              height: (30 / 375.0) * MediaQuery.of(context).size.width,
            ),

            //start of the discount section
            Discount(),
            //end of the discount section
            SizedBox(
              height: (30 / 375.0) * MediaQuery.of(context).size.width,
            ),

            //start of the categories section
            Categories(),
            //end of the categories section

            SizedBox(
              height: (30 / 375.0) * MediaQuery.of(context).size.width,
            ),

            //start of the special offer section (title)
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
                      color: Colors.black,
                    ),
                  ),
                  const Text("See More"),
                ],
              ),
            ),
            //end of the special offer section (title)

            SizedBox(
              height: (20 / 375.0) * MediaQuery.of(context).size.width,
            ),

            //start of the special offer scrollable section
            SpecialOffer(),
            //end of the special offer scrollable section

            SizedBox(
              height: (20 / 375.0) * MediaQuery.of(context).size.width,
            ),

            //start of the popular products section (title)
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
                      color: Colors.black,
                    ),
                  ),
                  const Text("Popular Products"),
                ],
              ),
            ),
            //end of the popular products section (title)

            SizedBox(
              height: (20 / 375.0) * MediaQuery.of(context).size.width,
            ),
            //start of the popular product section
            PopularProducts(),
            //end of the popular products section

            SizedBox(
              height: (20 / 375.0) * MediaQuery.of(context).size.width,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)),
              height: 45,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  signUserout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()), // Replace `HomeScreen` with the actual name of your HomeScreen widget
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ), backgroundColor: const Color.fromARGB(255, 176, 51, 42),
                ),
                child: const Text(
                  "Sign out",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            //start of the bottom nav bar

            //end of the bottom nav bar

          ],
        ),
      ),
    );
  }
}
