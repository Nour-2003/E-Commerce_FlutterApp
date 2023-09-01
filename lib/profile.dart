import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training_project/screens/login.dart';

class Profile extends StatelessWidget {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? ''; // Get the user's email or an empty string if not available

    // Extract the username from the email (before '@')
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
        title: Text('Profile')
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50,),
            // User Info
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.blue,
              child: Text(
                username.isEmpty ? '?' : username[0].toUpperCase(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              username.isEmpty ? 'User Name' : username,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),

            // Settings Section
            ListTile(
              title: Text("Settings"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                // Navigate to the Settings page
              },
            ),

            // Language Section
            ListTile(
              title: Text("Language"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                // Navigate to the Language page
              },
            ),

            // Dark Mode Section
            SwitchListTile(
              title: Text("Dark Mode"),
              value: false, // Set the initial value based on dark mode status
              onChanged: (value) {
                // Handle dark mode switch
              },
            ),

            SizedBox(height: 30),

            // Sign Out Button
            Container(
              height: 45,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  signUserOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: const Color.fromARGB(255, 176, 51, 42),
                ),
                child: Text(
                  "Sign out",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
