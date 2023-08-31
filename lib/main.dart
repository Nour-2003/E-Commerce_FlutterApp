import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:training_project/firebase_options.dart';
//import 'package:training_project/home/components/homeScreen.dart';
import 'package:training_project/myApplication.dart';
import 'package:training_project/screens/auth_page.dart';
import 'package:training_project/screens/login.dart';
import 'package:training_project/screens/splash_screen.dart';
import 'package:dio/dio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
 //  name: 'ecommsignin',
    options: const FirebaseOptions(
        apiKey: "AIzaSyA6NFUMe_bv8_bY0X1bmV8qnqVHLsWfask",
        appId: "1:256799517051:android:dd9363916a69f3ea6375de",
        messagingSenderId: "256799517051",
        projectId: "ecommsignin",
    ),
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash_screen(),
    );
  }
}
