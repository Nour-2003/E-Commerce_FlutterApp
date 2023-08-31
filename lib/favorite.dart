import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:training_project/customNavBar.dart';



class Favorite extends StatelessWidget
{
  @override
  Widget build(context)
  {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF7643),
                Color(0xff281537),
              ],
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, // Set the color you want
        ),
      ),
        body:Center(
            child: Text(
                'favourite Screen'
            )
        )
    );
  }
}