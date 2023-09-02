import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? ''; // Get the user's email or an empty string if not available
    final username = email.split('@')[0];
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
        title: Text("Notifications"),
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),

              Text(
                "Welcome back, $username!",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),

              // Add more notification-related content here
              Text(
                "Make the most of your summer spending!\nGet a fantastic cash back offer on select purchases within our app.",
                style: TextStyle(fontSize: 20),
              ),
              // You can add more notification content here
            ],
          ),
        ),
      ),
    );
  }
}
