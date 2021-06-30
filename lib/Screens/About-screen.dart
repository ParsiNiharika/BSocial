import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import '../Screens/Navigation-screen.dart';
import '../Models/model.dart';

class AboutScreen extends StatefulWidget {
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final List<Person> managingCommitte;
  final List<Person> actionCommitte;
  final String registrationLink;
  final List<String> contactUs;

  AboutScreen(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.description,
      required this.gallery,
      required this.managingCommitte,
      required this.actionCommitte,
      required this.registrationLink,
      required this.contactUs});

  @override
  _Main createState() => _Main(
      title: this.title,
      id: this.id,
      imageUrl: this.imageUrl,
      description: this.description,
      gallery: this.gallery,
      managingCommitte: this.managingCommitte,
      actionCommitte: this.actionCommitte,
      registrationLink: this.registrationLink,
      contactUs: this.contactUs);
}

class _Main extends State<AboutScreen> {
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final List<Person> managingCommitte;
  final List<Person> actionCommitte;
  final String registrationLink;
  final List<String> contactUs;

  int _index = 1;

  _Main(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.description,
      required this.gallery,
      required this.managingCommitte,
      required this.actionCommitte,
      required this.registrationLink,
      required this.contactUs});

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
        backgroundColor: Colors.red[800],
      ),
      body: Container(
        child: NavigationScreen(
            title: this.title,
            id: this.id,
            imageUrl: this.imageUrl,
            description: this.description,
            gallery: this.gallery,
            index: this._index,
            managingCommitte: this.managingCommitte,
            actionCommitte: this.actionCommitte,
            registrationLink: this.registrationLink,
            contactUs: this.contactUs),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.red,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.collections, size: 20, color: Colors.black),
          Icon(Icons.home, size: 20, color: Colors.black),
          Icon(Icons.comment, size: 20, color: Colors.black),
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
