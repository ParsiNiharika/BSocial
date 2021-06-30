import 'package:flutter/cupertino.dart';

class Category{
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final List<String> gallery;


  const Category({
    required this.id ,
    required this.title,
    required this.imageUrl,
    required this. description,
    required this.gallery,
  });
}

