import 'package:flutter/material.dart';
import 'body.dart';

class HomeScreen extends StatelessWidget
{

 static String routeName = "/home";

  @override
  Widget build(context)
  {
    return Scaffold(
      body: Body(),
    );
  }
}