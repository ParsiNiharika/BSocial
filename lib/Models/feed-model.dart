import 'package:flutter/cupertino.dart';

class Feed {
  final String id;
  final String title;
  final String imageUrl;
  final String description;

  const Feed(
      {
        required this.id,
        required this.title,
        required this.imageUrl,
        required this.description,
      }
      );
}