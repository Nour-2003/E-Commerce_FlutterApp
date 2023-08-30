import 'package:training_project/customNavBar.dart';
import 'package:flutter/material.dart';
import 'package:training_project/home/components/homeScreen.dart';
import 'package:training_project/profile.dart';
import 'package:training_project/favorite.dart';
import 'package:training_project/home/components/body.dart';



class MyApplication extends StatefulWidget {
  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication>
{
   int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    Favorite(),
    Profile(),
  ];

   @override
  Widget build(context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar:CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          }
        ),
      ),
    );
  }
}


