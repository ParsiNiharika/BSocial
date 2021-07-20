import 'package:flutter/material.dart';

import '../Widgets/about-widget.dart';
import '../Screens/events-screen.dart';
import '../Screens/feed-screen.dart';

class NavigationScreen extends StatelessWidget {
  final int? index;
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final String registrationLink;
  final List<String> contactUs;
  final List<String> events;

  NavigationScreen(
      {this.index,
      required this.title,
      required this.id,
      required this.imageUrl,
      required this.description,
      required this.gallery,
      required this.registrationLink,
      required this.contactUs,
      required this.events});

  @override
  Widget build(BuildContext context) {
    if (index == null || index == 1) {
      return About(
          title: this.title,
          id: this.id,
          imageUrl: this.imageUrl,
          description: this.description,
          gallery: this.gallery,
          registrationLink: this.registrationLink,
          contactUs: this.contactUs,
          );
    } else if (index == 0) {
      return EventScreen(id: this.id,events:this.events);
    } else {
      return FeedScreen(id: this.id);
    }
  }
}
