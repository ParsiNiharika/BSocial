import 'package:flutter/material.dart';
import '../Data/student-chapters.dart';
import '../Widgets/logo-cards.dart';
import 'package:test/styles.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("First App", style: TextStyle(
            color: Colors.white,
          ),),
      ),
      body:Container(
        color: Colors.grey,
        child: GridView(
          padding: EdgeInsets.all(25),
          children: StudentChapter_Data.map((data)=> LogoCard(title: data.title, id: data.id, imageUrl: data.imageUrl,description: data.description,gallery: data.gallery)).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 2.1 / 2.2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),),
      )
    );
  }
}