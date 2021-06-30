import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/main-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:  "HOME PAGE",
      home: MainScreen(),
    );
  }
}

class Home extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("First App", style: TextStyle(
          color: Colors.white,
        ),),
      ),
    );
  }
}

