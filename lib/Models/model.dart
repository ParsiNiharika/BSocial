import 'package:flutter/cupertino.dart';

class Category {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final List<Person> managingCommitte;
  final List<Person> actionCommitte;
  final String registrationLink;
  final List<String> contactUs;

  const Category(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.gallery,
      required this.managingCommitte,
      required this.actionCommitte,
      required this.registrationLink,
      required this.contactUs});
}

class Person {
  final String id;
  final String name;
  final String position;

  const Person({
    required this.id,
    required this.name,
    required this.position,
  });
}
