import 'package:flutter/cupertino.dart';

class StudentChapter {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final String registrationLink;
  final List<String> contactUs;
  final List<String> events;

  StudentChapter(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.gallery,
      required this.registrationLink,
      required this.contactUs,
      required this.events});
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
