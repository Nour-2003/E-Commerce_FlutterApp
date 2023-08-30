import 'package:flutter/material.dart';
import 'package:training_project/home/components/body.dart';

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