import 'package:flutter/material.dart';
//import 'package:training_project/customNavBar.dart';
import 'package:training_project/screens/login.dart';
//import 'package:training_project/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Profile extends StatelessWidget
{

   void signUserout()
  {
    FirebaseAuth.instance.signOut();

  }
  @override
  Widget build(context)
  {
    return  SafeArea(
      child: Container(
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(30)),
                 height: 45,
                 width: 200,
                 child: ElevatedButton(
                   onPressed: () {
                     signUserout();
                     Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(builder: (context) => LoginPage()), // Replace `HomeScreen` with the actual name of your HomeScreen widget
                     );
                   },
                   style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15),
                     ), backgroundColor: const Color.fromARGB(255, 176, 51, 42),
                   ),
                   child: const Text(
                     "Sign out",
                     style: TextStyle(fontWeight: FontWeight.w700),
                   ),
                 ),
               ),
    );
  }
}