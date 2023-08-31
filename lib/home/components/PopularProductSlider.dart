import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dio/dio.dart';

class PopularProducts extends StatefulWidget {
  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  var jasonList = [];

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
    return jasonList.isNotEmpty
        ? Container(
      height: 250, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: jasonList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: (20 / 375.0) * MediaQuery.of(context).size.width),
            child: SizedBox(
              width: (140 / 375.0) * MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1.02,
                    child: Container(
                      padding: EdgeInsets.all(
                          (20 / 375.0) * MediaQuery.of(context).size.width),
                      decoration: BoxDecoration(
                        color:
                        const Color(0xFF979797).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(
                        jasonList[index]['images'][0] ??
                            "https://i.dummyjson.com/data/products/1/1.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    jasonList[index]["title"],
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${jasonList[index]["price"].toString()}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 184, 96, 56),
                        ),
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
                ],
              ),
            ),
          );
        },
      ),
    )
        : Center(
      child: CircularProgressIndicator(color: Colors.black12),
    );
  }
}
