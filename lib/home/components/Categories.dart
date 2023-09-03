import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_project/screens/CategoryProductsPage.dart';

class Categories extends StatelessWidget {
  final List<Map<String, dynamic>> category = [
    {"icon": "HomePageImgs/mobile-svgrepo-com.svg", "text": "smartphones"},
    {"icon": "HomePageImgs/laptop-svgrepo-com.svg", "text": "laptops"},
    {"icon": "HomePageImgs/broom-svgrepo-com.svg", "text": "skincare"},
    {"icon": "HomePageImgs/perfume-svgrepo-com.svg", "text": "fragrances"},
    {"icon": "HomePageImgs/groceries-svgrepo-com.svg", "text": "groceries"},
  ];

  final List<dynamic> jsonList; // Define jsonList as a property

  Categories({required this.jsonList}); // Constructor to receive jsonList

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (20 / 375.0) * MediaQuery.of(context).size.width,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < category.length; i++)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryProductsPage(
                      categoryText: category[i]["text"],
                      productList: jsonList, // Pass jsonList to the page
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: (55 / 375.0) * MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        padding: EdgeInsets.all(
                            (15 / 375.0) * MediaQuery.of(context).size.width),
                        decoration: BoxDecoration(
                          color: const Color(0xFFf2e9e4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(category[i]["icon"],
                          color: Color(0xff9a8c98),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      category[i]["text"],
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white // Change this to white for dark theme
                            :Color(0xff22223b),
                       //color: Colors.black
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
