import 'package:training_project/customNavBar.dart';
import 'package:flutter/material.dart';
import 'package:training_project/profile.dart';
import 'package:training_project/favorite.dart';
import 'package:training_project/home/components/body.dart';



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
   int _currentIndex = 0;

  final List<Widget> _screens = [
    Body(),
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


