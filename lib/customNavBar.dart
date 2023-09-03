import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget 
{
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  _CustomBottomNavigationBarState createState() =>_CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> 
{
  @override
  Widget build( context)
  {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,


      selectedItemColor: Theme.of(context).brightness == Brightness.dark?
      Color(0xffadb5bd)
      : Color(0xff22223b), // Active color
      unselectedItemColor: Theme.of(context).brightness == Brightness.dark?
      Color(0xff495057)
      :Colors.grey, // Unselected color
      items: const[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}