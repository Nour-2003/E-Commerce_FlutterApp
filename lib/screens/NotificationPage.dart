import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? ''; // Get the user's email or an empty string if not available
    final username = email.split('@')[0];

    final appColors = [
      Color(0xFF22223B),
      Color(0xff4A4E69),
      Color(0xff9A8C98),
      Color(0xffC9ADA7),
      Color(0xffF2E9E4),
    ];

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: appColors,
            ),
          ),
        ),
        title: Text("Notifications"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 16), // Adjust the right padding here
                child: Text(
                  "Welcome back, $username!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Make the most of your summer spending! Get a fantastic cashback offer on select purchases within our app.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for the button, e.g., navigate to a specific screen.
                },
                style: ElevatedButton.styleFrom(
                  primary: appColors[0], // Set button background to the first color in the gradient
                  padding: EdgeInsets.all(0), // Remove default button padding
                ),
                child: Container(
                  width: 200, // Adjust button width as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), // Add rounded corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      "Explore Offers",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
