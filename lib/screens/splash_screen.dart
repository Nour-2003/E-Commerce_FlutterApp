import 'package:flutter/material.dart';
import 'package:training_project/screens/auth_page.dart';
import 'package:training_project/screens/login.dart';

class splash_screen extends StatefulWidget {
  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0;
      });
    });

    return Scaffold(
      backgroundColor: Colors.transparent, // Set background to transparent
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF7643),
              Color(0xff281537),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 150),
              curve: Curves.easeIn,
              child: const Text(
                "our project",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
