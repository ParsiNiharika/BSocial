import 'package:flutter/material.dart';
import '../Screens/About-screen.dart';
import '../Models/model.dart';

class LogoCard extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final String registrationLink;
  final List<String> contactUs;
  final List<String> events;

  LogoCard(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.description,
      required this.gallery,
      required this.registrationLink,
      required this.contactUs,
      required this.events});

  selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AboutScreen(
        title: this.title,
        id: this.id,
        imageUrl: this.imageUrl,
        description: this.description,
        gallery: this.gallery,
        registrationLink: this.registrationLink,
        contactUs: this.contactUs,
        events: this.events,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectCategory(context),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(),
            image: DecorationImage(
              image: AssetImage(
                  imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}
