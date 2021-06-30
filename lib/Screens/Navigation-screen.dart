import 'package:flutter/material.dart';

import '../Widgets/about-widget.dart';
import '../Screens/popup-screen.dart';
import '../Models/model.dart';

class NavigationScreen extends StatelessWidget {
  final int? index;
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final List<Person> managingCommitte;
  final List<Person> actionCommitte;
  final String registrationLink;
  final List<String> contactUs;

  NavigationScreen(
      {this.index,
      required this.title,
      required this.id,
      required this.imageUrl,
      required this.description,
      required this.gallery,
      required this.managingCommitte,
      required this.actionCommitte,
      required this.registrationLink,
      required this.contactUs});

  @override
  Widget build(BuildContext context) {
    if (index == null || index == 1) {
      return About(
          title: this.title,
          id: this.id,
          imageUrl: this.imageUrl,
          description: this.description,
          gallery: this.gallery,
          managingCommitte: this.managingCommitte,
          actionCommitte: this.actionCommitte,
          registrationLink: this.registrationLink,
          contactUs: this.contactUs);
    } else if (index == 0) {
      return PopupScreen();
    } else {
      return PopupScreen();
    }
  }
}
