import 'package:flutter/material.dart';

import '../Widgets/about-wdiget.dart';
import '../Screens/popup-screen.dart';

class NavigationScreen extends StatelessWidget{

  final int? index;
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;

  NavigationScreen({this.index, required this.title, required this.id, required this.imageUrl, required this.description, required this.gallery});

  @override
  Widget build(BuildContext context) {
    if(index==null || index==1){
      return  About(title: this.title,id: this.id, imageUrl: this.imageUrl,description: this.description, gallery: this.gallery,);
    }
    else{
      return PopupScreen();
    }
  }
}