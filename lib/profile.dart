import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training_project/screens/login.dart';

class Profile extends StatelessWidget {
  void signUserOut() {
    FirebaseAuth.instance.signOut();//signing out function
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? '';
    final username = email.split('@')[0];

    // Determine brightness based on the background color
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final isDarkMode = backgroundColor.computeLuminance() < 0.5;

    return Theme(
      data: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
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
          ),
          title: Text('Profile'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: const Color(0xff22223b),
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
                ListTile(
                  title: Text("Settings"),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    // Navigate to the Settings page
                  },
                ),
                ListTile(
                  title: Text("Language"),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    // Navigate to the Language page
                  },
                ),
                SwitchListTile(
                  title: Text("Dark Mode"),
                  value: isDarkMode,
                  onChanged: (value) {
                    // Handle dark mode switch
                  },
                ),
                SizedBox(height: 30),
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
                      backgroundColor: const Color(0xff22223b),
                    ),
                    child: Text(
                      "Sign out",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
