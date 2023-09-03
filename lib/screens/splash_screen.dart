import 'package:flutter/material.dart';
import 'package:training_project/screens/auth_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;
  double iconOffsetX = -100.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0;
        iconOffsetX = (MediaQuery.of(context).size.width / 2) - 100.0; // Center the icons horizontally
      });
    });
    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF22223B),
              Color(0xff4A4E69),
              Color(0xff9A8C98),
              Color(0xffC9ADA7),
              Color(0xffF2E9E4),
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              AnimatedPositioned(
                top: MediaQuery.of(context).size.height / 2 - 30,
                left: iconOffsetX,
                duration: Duration(milliseconds: 2000), // Smoother icon animation
                curve: Curves.easeInOut,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.devices,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    AnimatedOpacity(
                      opacity: opacity,
                      duration: Duration(milliseconds: 1000), // Fade-in duration
                      curve: Curves.easeIn,
                      child: const Text(
                        "Amicus",
                        style: TextStyle(
                          color: Color(0xfff2e9e4),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
