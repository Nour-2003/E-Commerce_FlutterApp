import 'package:flutter/material.dart';

class Discount extends StatelessWidget
{
  @override
  Widget build(context)
  {
    return Container(
              margin: EdgeInsets.symmetric(
                horizontal: (20 / 375.0) * MediaQuery.of(context).size.width,
              ),
              padding: EdgeInsets.symmetric(
                horizontal:  (20 / 375.0) * MediaQuery.of(context).size.width,
                vertical: (15 / 375.0) * MediaQuery.of(context).size.width,
              ),
              width: double.infinity,
              //height: 90,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark?
                Color(0xff212529)
                : Color(0xff22223b),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text.rich(
                TextSpan(
                  text: "A Summer Surprise\n",
                  style: TextStyle(
                    color:Theme.of(context).brightness == Brightness.dark?
                        Color(0xffdee2e6)
                     :Color(0xfff2e9e4),
                  ),
                  children: [
                    TextSpan(
                      text: "CashBack 20%",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark?
                        Color(0xffdee2e6)
                     :Color(0xfff2e9e4),
                      ),
                    ),
                  ],
                 ),
                ),
            );
  }
}