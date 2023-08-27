import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  final List<Map<String, dynamic>> category = [
    {"icon": "HomePageImgs/FlashIcon.svg", "text": "Flash Deal"},
    {"icon": "HomePageImgs/BillIcon.svg", "text": "Bill"},
    {"icon": "HomePageImgs/GameIcon.svg", "text": "Game"},
    {"icon": "HomePageImgs/GiftIcon.svg", "text": "Daily Gift"},
    {"icon": "HomePageImgs/Discover.svg", "text": "More"},
  ];

  @override
  Widget build(context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: (20 / 375.0) * MediaQuery.of(context).size.width,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: (55 / 375.0) * MediaQuery.of(context).size.width,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(
                        (15 / 375.0) * MediaQuery.of(context).size.width),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECDF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(category[0]["icon"]),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  category[0]["text"],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            width: (55 / 375.0) * MediaQuery.of(context).size.width,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(
                        (15 / 375.0) * MediaQuery.of(context).size.width),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECDF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(category[1]["icon"]),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  category[1]["text"],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            width: (55 / 375.0) * MediaQuery.of(context).size.width,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(
                        (15 / 375.0) * MediaQuery.of(context).size.width),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECDF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(category[2]["icon"]),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  category[2]["text"],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            width: (55 / 375.0) * MediaQuery.of(context).size.width,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(
                        (15 / 375.0) * MediaQuery.of(context).size.width),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECDF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(category[3]["icon"]),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  category[3]["text"],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            width: (55 / 375.0) * MediaQuery.of(context).size.width,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(
                        (15 / 375.0) * MediaQuery.of(context).size.width),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFECDF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(category[4]["icon"]),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  category[4]["text"],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
