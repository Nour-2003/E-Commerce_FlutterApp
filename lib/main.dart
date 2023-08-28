import 'package:flutter/material.dart';
//import 'package:training_project/home/components/homeScreen.dart';
import 'package:training_project/myApplication.dart';
import 'package:training_project/screens/splash_screen.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{

 @override
 Widget build (context)
 {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: splash_screen(),
   );
 }
}