import 'package:flutter/material.dart';
import '../Screens/About-screen.dart';
import '../Models/model.dart';

class LogoCard extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final List<Person> managingCommitte;
  final List<Person> actionCommitte;
  final String registrationLink;
  final List<String> contactUs;

  LogoCard(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.description,
      required this.gallery,
      required this.managingCommitte,
      required this.actionCommitte,
      required this.registrationLink,
      required this.contactUs});

  selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AboutScreen(
        title: this.title,
        id: this.id,
        imageUrl: this.imageUrl,
        description: this.description,
        gallery: this.gallery,
        managingCommitte: this.managingCommitte,
        actionCommitte: this.actionCommitte,
        registrationLink: this.registrationLink,
        contactUs: this.contactUs
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
