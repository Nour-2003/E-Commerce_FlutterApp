import 'package:training_project/customNavBar.dart';
import 'package:flutter/material.dart';
import 'package:training_project/home/components/homeScreen.dart';
import 'package:training_project/profile.dart';
import 'package:training_project/favorite.dart';
import 'package:training_project/home/components/body.dart';
import 'package:training_project/theme/dark_theme.dart';
import 'package:training_project/theme/light_theme.dart';



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
    bool iconBool = false;
   IconData iconLight = Icons.wb_sunny;
   IconData iconDark = Icons.nights_stay;
   @override
  Widget build(context)
  {
    return MaterialApp(
      theme: iconBool ? darkTheme : lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: iconBool? Colors.white : Colors.black,
        floatingActionButton:FloatingActionButton(
          onPressed: () {
            setState(() {
              iconBool = !iconBool;
            });
          },
          child: Icon(
            iconBool ? iconLight : iconDark,
            color:iconBool? Colors.white : Colors.black,
          ),
        ),
        floatingActionButtonLocation:FloatingActionButtonLocation.endFloat ,
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


