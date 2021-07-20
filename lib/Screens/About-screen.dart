import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';

import '../Screens/Navigation-screen.dart';

class AboutScreen extends StatefulWidget {
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final String registrationLink;
  final List<String> contactUs;
  final List<String> events;

  AboutScreen(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.description,
      required this.gallery,
      required this.registrationLink,
      required this.contactUs,
      required this.events});

  @override
  _Main createState() => _Main(
      title: this.title,
      id: this.id,
      imageUrl: this.imageUrl,
      description: this.description,
      gallery: this.gallery,
      registrationLink: this.registrationLink,
      contactUs: this.contactUs,
      events: this.events);
}

class _Main extends State<AboutScreen> {
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final String registrationLink;
  final List<String> contactUs;
  final List<String> events;

  int _index = 1;

  _Main(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.description,
      required this.gallery,
      required this.registrationLink,
      required this.contactUs,
        required this.events});

  selectIcon(index, context) {
    setState(() {
      this._index = index;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: NavigationScreen(
            title: this.title,
            id: this.id,
            imageUrl: this.imageUrl,
            description: this.description,
            gallery: this.gallery,
            index: this._index,
            registrationLink: this.registrationLink,
            contactUs: this.contactUs,
            events: this.events),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color:Colors.pink,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.transparent,
        items: <Widget>[
          Tooltip(message: "Events",
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child:Icon(Icons.collections, size: 20, color: Colors.black),),

          Tooltip(message: "About",
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child:Icon(Icons.home, size: 20, color: Colors.black),),

          Tooltip(message: "Feed",
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child:Icon(Icons.comment, size: 20, color: Colors.black),),
        ],
        animationDuration: Duration(
          milliseconds: 200,
        ),
        index: 1,
        onTap: (index) {
          selectIcon(index, context);
        },
      ),
    );
  }
}
